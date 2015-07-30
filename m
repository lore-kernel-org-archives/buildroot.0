From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 30 Jul 2015 16:30:36 +0100
Subject: [Buildroot] [PATCH 1/1] packages/btrfs-progs: fix build issues
 under musl
In-Reply-To: <20150730162421.5a12b1aa@free-electrons.com>
References: <1438195815-29424-1-git-send-email-brendanheading@gmail.com>
 <20150729224726.71925205@free-electrons.com>
 <CA+BsyQ5rwfHxZTShaEum3A456-zFekijGV_+EsUH9=tGenUTBA@mail.gmail.com>
 <20150730162421.5a12b1aa@free-electrons.com>
Message-ID: <CA+BsyQ5uqD3NJTfJg0oFU-A5gUH8qpNNhRx69ypWMO62dvG8qQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> So, I think my patch should be adapted. You need to:
>
>  * Remove the m4/ax_gcc_func_attribute.m4 file, revert my .gitignore
>    change and remove the added AC_CONFIG_MACRO_DIR([m4]).
>
>  * Add AC_CHECK_DECLS([__always_inline]) in configure.ac, and do
>    #ifndef HAVE_DECL___ALWAYS_INLINE in kerncompat.h.
>
> It will in fact make the patch a lot simpler, which is good.

Thomas,

Tested with both the autobuild config (musl) and Linaro 2014.9, builds
fine. Forwarding the buildroot patches now, then I'll look at
submitting them upstream.

regards

Brendan
