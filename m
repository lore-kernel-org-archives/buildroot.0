From: prabindh <prabu@ti.com>
Date: Wed, 22 May 2013 08:57:52 -0700 (PDT)
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <CAEBucnD611SuUDumeQXDWsZwxeWfZ4G-wnxULE4xxPV_T1qB4A@mail.gmail.com>
References: <20130522141715.70be80c2@skate>
 <321768C95D21724485BCE784F1BE98473EB1DA3C@DBDE04.ent.ti.com>
 <20130522143117.02a92237@skate>
 <321768C95D21724485BCE784F1BE98473EB1DAA4@DBDE04.ent.ti.com>
 <20130522150653.611899a4@skate>
 <321768C95D21724485BCE784F1BE98473EB1DC4F@DBDE04.ent.ti.com>
 <20130522153044.76f14e2d@skate>
 <321768C95D21724485BCE784F1BE98473EB1DCB9@DBDE04.ent.ti.com>
 <20130522160405.3b37b060@skate>
 <CAEBucnD611SuUDumeQXDWsZwxeWfZ4G-wnxULE4xxPV_T1qB4A@mail.gmail.com>
Message-ID: <321768C95D21724485BCE784F1BE98473EB1DE73@DBDE04.ent.ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recipe will be upgraded to the below - I just submitted revised patchset:  So please keep that in mind when building your recipe. The new recipe removes lot of unsupported old features, and generally cleans up the rest.

http://comments.gmane.org/gmane.linux.embedded.yocto.meta-ti/1946

regards,
Prabu

From: Spenser Gilliland-2 [via Buildroot (busybox)] [mailto:ml-node+s2317881n45674h97 at n4.nabble.com]
Sent: Wednesday, May 22, 2013 8:10 PM
To: Sundareson, Prabindh
Subject: Re: Currently packaging Qt5

Prabu & Thomas,

I was actually working on this last night!  As a resource I am using
the ti-meta overlay from
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
.  I can download and build the driver (kinda of messy), but I haven't
tested it yet.  You can see the progress on my Github.

I've automated the license acceptance as well as the sgx driver build.
 Still working on the rest.

Spenser

On Wed, May 22, 2013 at 9:04 AM, Thomas Petazzoni
<[hidden email]</user/SendEmail.jtp?type=node&node=45674&i=0>> wrote:

> Dear prabindh,
>
> On Wed, 22 May 2013 06:35:55 -0700 (PDT), prabindh wrote:
>
>> Yes, I am talking about rebuilding the userspace libraries. I deliver
>> the Graphics drivers for SGX.
>
> Ah, nice to have you on board then :-) We may certainly have questions
> as we integrate those libraries in Buildroot.
>
>> The aspect of uclibc breaking compatibility was not clear to me
>> earlier. How do you plan to support "any" closed source packages
>> then ?
>
> With (e)glibc libraries, that we support through the external toolchain
> mechanism.
>
>> Why cant we have backward compatibility in uclibc ?
>
> I am not sure how accurate
> https://www.kernel.org/pub/linux/libs/uclibc/Glibc_vs_uClibc_Differences.txt
> is, must it says:
>
> """
> 3) uClibc does not even attempt to ensure binary compatibility across
> releases. When a new version of uClibc is released, you may or may not
> need to recompile all your binaries.
> """
>
> That said, the uClibc web site, at http://www.uclibc.org/oldnews.html,
> says:
>
> """
> Please be aware we will break binary compatibilty in the upcoming
> 0.9.27 release to implement a few necessary changes we have been
> postponing. That will hopefully be the last ABI change before we freeze
> the ABI for the upcoming 1.0.x stable uClibc series.
> """
>
> So it looks like there was some intention about having a stable ABI at
> some point. But this news was from 2004, and the 1.0.x stable uClibc
> series still hasn't been released, 9 years later.
>
> Maybe other people can comment? Or maybe we should bring the issue to
> the uClibc developers and see what they say?
>
> In the mean time, my expectation is that we will be using all those
> binary-only libraries on top of glibc/eglibc only. If you're doing some
> crazy OpenGL multimedia stuff, you can anyway afford the comparatively
> small additional cost of using glibc/eglibc in your embedded Linux
> system.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> [hidden email]</user/SendEmail.jtp?type=node&node=45674&i=1>
> http://lists.busybox.net/mailman/listinfo/buildroot



--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
_______________________________________________
buildroot mailing list
[hidden email]</user/SendEmail.jtp?type=node&node=45674&i=2>
http://lists.busybox.net/mailman/listinfo/buildroot

________________________________
If you reply to this email, your message will be added to the discussion below:
http://buildroot-busybox.2317881.n4.nabble.com/Currently-packaging-Qt5-tp38584p45674.html
To unsubscribe from Currently packaging Qt5, click here<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=unsubscribe_by_code&node=38584&code=cHJhYnVAdGkuY29tfDM4NTg0fDE0OTk5ODQwMzg=>.
NAML<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=macro_viewer&id=instant_html%21nabble%3Aemail.naml&base=nabble.naml.namespaces.BasicNamespace-nabble.view.web.template.NabbleNamespace-nabble.view.web.template.NodeNamespace&breadcrumbs=notify_subscribers%21nabble%3Aemail.naml-instant_emails%21nabble%3Aemail.naml-send_instant_email%21nabble%3Aemail.naml>




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Currently-packaging-Qt5-tp38584p45683.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130522/0492ecc3/attachment-0001.html>
