From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 1 May 2016 08:49:33 +0200
Subject: [Buildroot] [PATCH] libtommath: add -fPIC
In-Reply-To: <87twijrl81.fsf@dell.be.48ers.dk>
References: <1462005187-32394-1-git-send-email-francois.perrad@gadz.org>
 <20160430145512.34b475dc@free-electrons.com>
 <87twijrl81.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRss7N-snbF6paP2CzGQC3FMNwgTYBL=Q8TG6+E=q+=kO2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-04-30 20:43 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
>  > Hello,
>  > On Sat, 30 Apr 2016 10:33:07 +0200, Francois Perrad wrote:
>  >> fix build with x86_64, see
>  >> http://autobuild.buildroot.net/results/212/212469db5dc8399070390603c0fdf7f12b130cda/
>  >>
>  >> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  >> ---
>  >> package/libtommath/libtommath.mk | 2 +-
>  >> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>  > Applied to master, thanks.
>
> Hmm, isn't it a bit odd to build a static library with -fPIC?
>
> But OK, the error message seems to be from trying to link a shared
> library with it.
>

libtommath have a support for shared library via a makefile.shared.
But it is currently broken for cross compilation (bad linking with libtool).

Fran?ois

> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
