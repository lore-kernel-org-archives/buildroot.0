From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 29 Aug 2014 07:58:13 +0200
Subject: [Buildroot] [PATCH v3 4/4] gendoc infra: disable pdf manual
 generation if xsltproc is buggy
In-Reply-To: <1409078947-5093-4-git-send-email-s.martin49@gmail.com>
References: <1409078947-5093-1-git-send-email-s.martin49@gmail.com>
 <1409078947-5093-4-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LWuDmsS2_9o9jEANSs9gCs5Me8odSAovSUL+P1aDeWOuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,


Samuel Martin <s.martin49@gmail.com> schreef:
>The PDF manual generation reaches the default xsltproc's template
>recursion limit when processing the target package list; this makes the
>PDF manual generation fail [1-3].
>
>This limit can be raised with the '--maxvars' option. Unfortunately,
>this option is not correctly handled in the latest xsltproc/libxslt
>release (1.1.28), but this bug is already fixed in the libxslt
>repository [4].
>
>This patch disables the PDF manual generation (makes it fail with a
>meaningful error message) when the xsltproc program found in the PATH
>does not support the --maxvars option.
>So, one can still generate the PDF manual if he/she extends PATH with
>the location of a working xsltproc, by running:
>
>  $ PATH=/path/to/custom-xsltproc/bin:${PATH} make manual-pdf
>
>[1] http://lists.busybox.net/pipermail/buildroot/2014-August/104390.html
>[2] http://lists.busybox.net/pipermail/buildroot/2014-August/104418.html
>[3] http://lists.busybox.net/pipermail/buildroot/2014-August/104421.html
>[4] https://gitorious.org/libxslt/libxslt/commit/5af7ad745323004984287e48b42712e7305de35c
>
>Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>

Short question about this patch series: do we still consider it for
2014.08 or not?

Assuming that Peter does not yet have a patched xsltproc, it would be
better to generate a pdf manual but without tables, rather than having
no pdf manual at all, right?
In this case it makes sense to postpone this patch series to 2014.11.

Best regards,
Thomas
