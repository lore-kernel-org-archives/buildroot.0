From: buildrootcharles <charles.s@mercury-security.com>
Date: Thu, 28 Aug 2014 11:44:32 -0700 (PDT)
Subject: [Buildroot] Custom kernal patch not being run
In-Reply-To: <8b3f2afb-67cb-4547-8956-fc4ed95402e5@email.android.com>
References: <1409248855849-78152.post@n4.nabble.com>
 <8b3f2afb-67cb-4547-8956-fc4ed95402e5@email.android.com>
Message-ID: <B9E2549378AA7A4EB6855F980A8E5B88F2EC59@MSCENT02.corp.mercury-security.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas, I just tried that command and it still does not implement my patch. When I execute the command "make linux-dirclean linux" I see text that says ">>> linux custom Download additional patches" is this supposed to indicate it found my patch? I'm guessing that I have the patch file named wrong as I have read it needs to match exactly what is trying to be patched but I don't know if it should be named linux-custom (that's the folder name in output->build->) should it be named the same as the custom kernel tarball (linux-3.10.4-July302014)?

From: Thomas De Schampheleire [via Buildroot (busybox)] [mailto:ml-node+s2317881n78153h8 at n4.nabble.com]
Sent: Thursday, August 28, 2014 11:36 AM
To: Charles Stahl
Subject: Re: Custom kernal patch not being run

Hi Charles,

buildrootcharles <[hidden email]</user/SendEmail.jtp?type=node&node=78153&i=0>> schreef:

>I am trying to figure out how to create and have buildroot deploy a custom
>kernel patch (on my system only). I currently have my buildroot configured
>to  build a custom kernel from a tarball I have saved locally on my machine
>(filename Linux-3.10.4-July302014.tar.gz), I have created a patch file
>(named Linux-patch.patch) with the following content:
>
>*** /home/MSC/SVN_BuildRoot/output/build/linux-custom/net/ipv4/ipconfig.c
>2014-07-22 14:45:55.000000000 -0700
>--- /home/MSC/SVN_BuildRoot/board/ep4502/linux-patches/ipconfig.c 2014-08-28
>10:00:33.824586558 -0700
>***************
>*** 89,96 ****
>
>  /* Define the friendly delay before and after opening net devices */
>  #define CONF_POST_OPEN 10 /* After opening: 10 msecs */
>! #ifdef CONFIG_MACH_AT91SAM9G45_EP4502VBB
>! #define CONF_CARRIER_TIMEOUT 12000 /* Wait for carrier timeout */
>  #else
>  #define CONF_CARRIER_TIMEOUT 120000 /* Wait for carrier timeout */
>  #endif
>--- 89,96 ----
>
>  /* Define the friendly delay before and after opening net devices */
>  #define CONF_POST_OPEN 10 /* After opening: 10 msecs */
>! #ifdef CONFIG_MACH_AT91SAM9G45_EP4502MSC
>! #define CONF_CARRIER_TIMEOUT 30000 /* Wait for carrier timeout */
>  #else
>  #define CONF_CARRIER_TIMEOUT 120000 /* Wait for carrier timeout */
>  #endif
>
>I have specified the directory where the patch resides in the
>BR2_LINUX_KERNEL_PATCH="/home/patchdirectory/"
>whenever I run make Linux-rebuild it never seems to find my patch, do I have
>it named wrong?  can anyone help, I've been stuck on this for nearly 2 days?
>thanks.
>

linux-rebuild will not reapply patches.
Try
make linux-dirclean linux

Best regards,
Thomas

_______________________________________________
buildroot mailing list
[hidden email]</user/SendEmail.jtp?type=node&node=78153&i=1>
http://lists.busybox.net/mailman/listinfo/buildroot

________________________________
If you reply to this email, your message will be added to the discussion below:
http://buildroot-busybox.2317881.n4.nabble.com/Custom-kernal-patch-not-being-run-tp78152p78153.html
To unsubscribe from Custom kernal patch not being run, click here<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=unsubscribe_by_code&node=78152&code=Y2hhcmxlcy5zQG1lcmN1cnktc2VjdXJpdHkuY29tfDc4MTUyfC0yMTA5MTYzODgw>.
NAML<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=macro_viewer&id=instant_html%21nabble%3Aemail.naml&base=nabble.naml.namespaces.BasicNamespace-nabble.view.web.template.NabbleNamespace-nabble.view.web.template.NodeNamespace&breadcrumbs=notify_subscribers%21nabble%3Aemail.naml-instant_emails%21nabble%3Aemail.naml-send_instant_email%21nabble%3Aemail.naml>



This transmission may contain sensitive, confidential and/or privileged
information. The sender does not waive any privilege or confidentiality in the
event of an inadvertent transmission to an unauthorized recipient. In the event
of such a transmission, please kindly contact the sender and delete all copies of
email. It is the recipient's responsibility to check this email and any
attachments for viruses. Mercury Security and the sender accept no responsibility
whatsoever for any loss suffered as a result of a virus entering the recipient's
computer system. Thank you.



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Custom-kernal-patch-not-being-run-tp78152p78154.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140828/64b712d2/attachment.html>
