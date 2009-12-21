From: Stanley <eva2002@gmail.com>
Date: Mon, 21 Dec 2009 12:39:55 +0800
Subject: [Buildroot] update on a file in tslib not reflected after doing
	"Make"
In-Reply-To: <20091217083547.5af1c179@surf>
References: <ed7750810912142330nbfb9fb5q2b261926c6d2b4c2@mail.gmail.com>
	<20091215092751.7d9a48fe@surf>
	<ed7750810912152030x7fd04fd1g70a959b28f4ab9e4@mail.gmail.com>
	<87fx7a64jf.fsf@macbook.be.48ers.dk> <20091217083547.5af1c179@surf>
Message-ID: <ed7750810912202039i5d1f119bkf524569670b09f28@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I know what is my problem already and manage to resolve it. It is because
the changes is not updated into the target folder ie the lib files is update
in the output/build folder but not copied into the project folder (not
installed). I think its partly because I am using fakeroot option.

anyway, I just do the steps mentioned and delete the installed_file in
/project/<project_name>/autotools-stamps/

Thanks for your help

Regards,
Stanley

On Thu, Dec 17, 2009 at 3:35 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Wed, 16 Dec 2009 21:35:16 +0100,
> Peter Korsgaard <jacmet@uclibc.org> a ?crit :
>
> > If you are putting new .patch files under package/tslib then you need
> > to rerun the patch step. The easiest way of doing this is simply to
> > delete the build dir (rm -rf output/build/tslib*)
>
> Yeah, basically:
>
>  *) If you hack directly into output/build/tslib*, then you must remove
>    the .stamp_built stamp file and run make again. This will restart
>    the compile process at the build step of tslib (but will *not*
>    reconfigure tslib, so if you made any modifications at the
>    configure level, it won't work)
>
>  *) If you add new patches to package/tslib/, then as Peter said, the
>    easiest way is to rm -rf output/build/tslib.
>
> Cheers,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091221/86982212/attachment.htm>
