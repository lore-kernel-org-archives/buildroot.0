From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Tue, 5 Mar 2013 01:50:21 +0800
Subject: [Buildroot] [PATCH] stress: honor the BR2_PREFER_STATIC_LIB
	preference
In-Reply-To: <87boazb0qi.fsf@dell.be.48ers.dk>
References: <1362206128-27771-1-git-send-email-roylee17@gmail.com>
 <51337F8E.9070803@mind.be>
 <CAEvN+1hHaUvusQPDV8qbs8ipzx-m0+Vhe02FmeWZp9NMrPYJ=A@mail.gmail.com>
 <87boazb0qi.fsf@dell.be.48ers.dk>
Message-ID: <CAEvN+1goodcDSArm4csuju6CfydmYStuw-C4D98uEh1sTAT4Pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My pleasure.

I add comment in both commit log and makefile.
Please feel free to do necessary editing while committing.

Thanks.

Roy

On Tue, Mar 5, 2013 at 12:15 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "T" == Tzu-Jung Lee <roylee17@gmail.com> writes:
>
>  T>     ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  T>     SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
>  T>     TARGET_LDFLAGS += --static
>  T>     else
>  T>     SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
>  T>     endif
>
>  T> As you indicated, the --enable-static is given anyway in the
>  T> SHARED_STATIC_LIBS_OPTS.  Unfortunately, as long as the
>  T> --enable-static is given, stress links the program statically,
>  T> regardless how the --enable-shared or --disable-shared.  In this
>  T> case, stress would be linked statically regardless how the
>  T> BR2_PREFER_STATIC_LIB specifies.  So we need the patch to explicitly
>  T> tell it link the program dynamically by appending/overriding with
>  T> --disable-static.
>
> So you only need to pass --disable-static if !BR2_PREFER_STATIC_LIB?
> Could you please resend with a patch only doing that and a comment above
> it explaining why?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130305/51c26faf/attachment.html>
