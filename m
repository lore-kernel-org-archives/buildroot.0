From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Mar 2015 19:47:02 +0100
Subject: [Buildroot] [PATCH v3 1/8] postgresql: enable uclibc build
In-Reply-To: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
References: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150315194702.03e49125@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 10 Mar 2015 20:59:37 +0100, Peter Seiderer wrote:
> Build with uclibc and locale support failes with the following error
> message:
> 
> regc_pg_locale.c: In function ?pg_wc_isdigit?:
> regc_pg_locale.c:312:6: error: dereferencing pointer to incomplete type
>       isdigit_l((unsigned char) c, pg_regex_locale));
> 
> This can be fixed by overwriting the HAVE_LOCALE_T detection (thanks
> to Alex Potapenko <opotapenko@gmail.com> for the hint [1]).
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-March/121088.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've applied patches 1, 2 and 4 to 8 in this patch series. I haven't
applied patch 3 since I have comments on it, which I'll make as a reply
to the patch itself.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
