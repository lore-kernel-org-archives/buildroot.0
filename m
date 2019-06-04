From: Ivan Bagarolo <ivan.bagarolo@micronovasrl.com>
Date: Tue, 4 Jun 2019 16:02:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/libva: fix build with gcc < 5
In-Reply-To: <20190603195107.2347-1-fontaine.fabrice@gmail.com>
References: <20190603195107.2347-1-fontaine.fabrice@gmail.com>
Message-ID: <abdd937b-8e79-a1e8-d7c3-2a2bb3628e56@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Il 03/06/2019 21:51, Fabrice Fontaine ha scritto:
> Fixes:
>   - http://autobuild.buildroot.org/results/96fe1667190e1e08d672984f147ec8e8f5e2f4f1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Tested-by: Ivan Bagarolo <ivan.bagarolo@micronovasrl.com>

> ---
>   ...a-va_trace-unbreak-with-C89-after-b369467.patch | 35 ++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/libva/0001-va-va_trace-unbreak-with-C89-after-b369467.patch
> 
> diff --git a/package/libva/0001-va-va_trace-unbreak-with-C89-after-b369467.patch b/package/libva/0001-va-va_trace-unbreak-with-C89-after-b369467.patch
> new file mode 100644
> index 0000000000..19192742c8
> --- /dev/null
> +++ b/package/libva/0001-va-va_trace-unbreak-with-C89-after-b369467.patch
> @@ -0,0 +1,35 @@
> +From 6724011e8b52901f13dded130f0b47e8bdbd4dda Mon Sep 17 00:00:00 2001
> +From: Jan Beich <jbeich@FreeBSD.org>
> +Date: Wed, 10 Apr 2019 11:37:28 +0000
> +Subject: [PATCH] va/va_trace: unbreak with C89 after b3694671c784
> +
> +va/va_trace.c: In function 'va_TraceVAEncMiscParameterBuffer':
> +va/va_trace.c:3281: error: 'for' loop initial declaration used outside C99 mode
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/intel/libva/commit/6724011e8b52901f13dded130f0b47e8bdbd4dda]
> +---
> + va/va_trace.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/va/va_trace.c b/va/va_trace.c
> +index 0a17e5cd..d41f62c1 100755
> +--- a/va/va_trace.c
> ++++ b/va/va_trace.c
> +@@ -3271,6 +3271,7 @@ static void va_TraceVAEncMiscParameterBuffer(
> +     }
> +     case VAEncMiscParameterTypeROI:
> +     {
> ++        int i;
> +         VAEncMiscParameterBufferROI *p = (VAEncMiscParameterBufferROI *)tmp->data;
> +
> +         va_TraceMsg(trace_ctx, "\t--VAEncMiscParameterBufferROI\n");
> +@@ -3278,7 +3279,7 @@ static void va_TraceVAEncMiscParameterBuffer(
> +         va_TraceMsg(trace_ctx, "\tmax_delta_qp = %d\n", p->max_delta_qp);
> +         va_TraceMsg(trace_ctx, "\tmin_delta_qp = %d\n", p->min_delta_qp);
> +         va_TraceMsg(trace_ctx, "\troi_flags.bits.roi_value_is_qp_delta = %d\n", p->roi_flags.bits.roi_value_is_qp_delta);
> +-        for (int i = 0; i < p->num_roi; i++) {
> ++        for (i = 0; i < p->num_roi; i++) {
> +             va_TraceMsg(trace_ctx, "\troi[%d].roi_rectangle.x      = %d\n", i, p->roi[i].roi_rectangle.x);
> +             va_TraceMsg(trace_ctx, "\troi[%d].roi_rectangle.y      = %d\n", i, p->roi[i].roi_rectangle.y);
> +             va_TraceMsg(trace_ctx, "\troi[%d].roi_rectangle.width  = %d\n", i, p->roi[i].roi_rectangle.width);
> 

-- 
Ivan Bagarolo

*?*

*R&D**- Micronovasrl*
Sede: Via Niedda 3 - 35010 Vigonza (PD)
Tel. +39 049 8931563 - Fax. +39 049 8931346
Cod. Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
Sito WEB: _http://www.micronovasrl.com_

------------------------------------------------------------------------

/Ai sensi della Normativa sulla Privacy, D.L. n. 196/2003, si precisa
che le informazioni e i dati contenuti in questo documento e negli
allegati sono strettamente riservate e ad uso esclusivo del
destinatario. Il destinatario pu? richiederne la cancellazione, la
comunicazione, l'aggiornamento, la rettifica e l'integrazione secondo
quanto disposto dall'Art.7. In caso di ricevimento anche parziale del
seguente documento da parte di un soggetto diverso dal destinatario
indicato, questi ? in ogni caso diffidato dal leggerlo e/o farne uso a
qualsiasi titolo ed ? pregato di contattarci telefonicamente ai numeri
sopra indicati, nonch? distruggere il messaggio e i file allegati,
erroneamente ricevuti./
