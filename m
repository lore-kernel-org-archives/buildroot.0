From: prabindh <prabu@ti.com>
Date: Wed, 22 May 2013 06:35:55 -0700 (PDT)
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <20130522153044.76f14e2d@skate>
References: <1361247529229-40702.post@n4.nabble.com>
 <20130219162959.34295207@skate> <1369020695818-45544.post@n4.nabble.com>
 <321768C95D21724485BCE784F1BE98473EB1D960@DBDE04.ent.ti.com>
 <20130522141715.70be80c2@skate>
 <321768C95D21724485BCE784F1BE98473EB1DA3C@DBDE04.ent.ti.com>
 <20130522143117.02a92237@skate>
 <321768C95D21724485BCE784F1BE98473EB1DAA4@DBDE04.ent.ti.com>
 <20130522150653.611899a4@skate> <20130522153044.76f14e2d@skate>
Message-ID: <321768C95D21724485BCE784F1BE98473EB1DCB9@DBDE04.ent.ti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Yes, I am talking about rebuilding the userspace libraries. I deliver the Graphics drivers for SGX.

The aspect of uclibc breaking compatibility was not clear to me earlier. How do you plan to support "any" closed source packages then ? Why cant we have backward compatibility in uclibc ?

regards,
Prabu

From: Thomas Petazzoni-2 [via Buildroot (busybox)] [mailto:ml-node+s2317881n45666h49 at n4.nabble.com]
Sent: Wednesday, May 22, 2013 7:01 PM
To: Sundareson, Prabindh
Subject: Re: Currently packaging Qt5

Dear Sundareson, Prabindh,

On Wed, 22 May 2013 13:26:53 +0000, Sundareson, Prabindh wrote:

> Ok. What I really meant is - I am "rebuilding" the drivers with the
> Buildroot toolchain (so, potentially there will be a newer binary
> package exclusively for Buildroot). With these new drivers, will
> Spenser be able to create the required recipe ?

When you mean "drivers", do you mean the kernel drivers or the
userspace libraries? As far as I know, the kernel drivers are
open-source, so anyone can rebuild them.

However, the userspace libraries are binary-only. Of course, it appears
that you work at TI, so maybe you have access to the source code of
those userspace libraries that are, for us mere mortals, binary-only.

If it's the case, rebuilding them with the Buildroot toolchain and
providing us with the resulting binary would not make much sense
unfortunately: the uClibc library that Buildroot uses in its internal
toolchain backend does not provide any kind of backward compatible ABI.
So whenever the uClibc version or configuration is changed, the ABI
might be broken. So using binary-only userspace libraries in an uClibc
context is particularly difficult, I'm afraid.

Or maybe you're talking about something else?

Best regards,

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
_______________________________________________
buildroot mailing list
[hidden email]</user/SendEmail.jtp?type=node&node=45666&i=0>
http://lists.busybox.net/mailman/listinfo/buildroot

________________________________
If you reply to this email, your message will be added to the discussion below:
http://buildroot-busybox.2317881.n4.nabble.com/Currently-packaging-Qt5-tp38584p45666.html
To unsubscribe from Currently packaging Qt5, click here<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=unsubscribe_by_code&node=38584&code=cHJhYnVAdGkuY29tfDM4NTg0fDE0OTk5ODQwMzg=>.
NAML<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=macro_viewer&id=instant_html%21nabble%3Aemail.naml&base=nabble.naml.namespaces.BasicNamespace-nabble.view.web.template.NabbleNamespace-nabble.view.web.template.NodeNamespace&breadcrumbs=notify_subscribers%21nabble%3Aemail.naml-instant_emails%21nabble%3Aemail.naml-send_instant_email%21nabble%3Aemail.naml>




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Currently-packaging-Qt5-tp38584p45668.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130522/f2c32a7a/attachment.html>
