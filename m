From: salorob <r.salomons@ropesolutions.nl>
Date: Wed, 8 Jul 2015 04:38:06 -0700 (PDT)
Subject: [Buildroot] Buildroot Mono Compile fails on mscorlib
In-Reply-To: <20150708135209.18da05f9@free-electrons.com>
References: <1436336880640-104945.post@n4.nabble.com>
 <20150708135209.18da05f9@free-electrons.com>
Message-ID: <D1C2DD1B.197E2%r.salomons@ropesolutions.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Well, the post was created online, for some reason it didn't email the bits between the <raw> tags.

I'll try the packages from the original repository first, and will get back with that.

However: this was the original error:

Unhandled Exception:
Nested exception detected.
Original Exception: at Mono.CSharp.Driver.Main (string[]) <0x00048>

Nested exception:at System.Threading.Thread.get_CurrentThread () <0x00025>
at System.Globalization.NumberFormatInfo.get_CurrentInfo () <0x00008>at System.Globalization.NumberFormatInfo.GetInstance (System.IFormatProvider) <0x00069>
at int.ToString (string,System.IFormatProvider) <0x00026>
at string.FormatHelper (System.Text.StringBuilder,System.IFormatProvider,string,object[]) <0x00571>
at System.Text.StringBuilder.AppendFormat (System.IFormatProvider,string,object[]) <0x0001b>
at System.Text.StringBuilder.AppendFormat (string,object) <0x00052>
at System.Exception.AddFrames (System.Text.StringBuilder,string,string,System.Diagnostics.StackTrace) <0x00249>
at System.Exception.get_StackTrace () <0x0016b>
at System.Exception.ToString () <0x0010a>
at System.Exception.ToString () <0x000c4>


[ERROR] FATAL UNHANDLED EXCEPTION: Nested exception detected.
Original Exception: at Mono.CSharp.Driver.Main (string[]) <0x00048>

Nested exception:at System.Threading.Thread.get_CurrentThread () <0x00025>
at System.Globalization.NumberFormatInfo.get_CurrentInfo () <0x00008>at System.Globalization.NumberFormatInfo.GetInstance (System.IFormatProvider) <0x00069>
at int.ToString (string,System.IFormatProvider) <0x00026>
at string.FormatHelper (System.Text.StringBuilder,System.IFormatProvider,string,object[]) <0x00571>
at System.Text.StringBuilder.AppendFormat (System.IFormatProvider,string,object[]) <0x0001b>
at System.Text.StringBuilder.AppendFormat (string,object) <0x00052>
at System.Exception.AddFrames (System.Text.StringBuilder,string,string,System.Diagnostics.StackTrace) <0x00249>
at System.Exception.get_StackTrace () <0x0016b>
at System.Exception.ToString () <0x0010a>
at System.Exception.ToString () <0x000c4>


From: "Thomas Petazzoni-2 [via Buildroot ] (busybox)" <ml-node+s2317881n104965h0 at n4.nabble.com<mailto:ml-node+s2317881n104965h0@n4.nabble.com>>
Date: woensdag 8 juli 2015 13:29
To: Robert Salomons <r.salomons at ropesolutions.nl<mailto:r.salomons@ropesolutions.nl>>
Subject: Re: Buildroot Mono Compile fails on mscorlib

Hello,

On Tue, 7 Jul 2015 23:28:00 -0700 (PDT), salorob wrote:

> I'm struggling to get mono build in Buildroot. I 'took' the mono and the
> moonlight packages in https://github.com/maximeh.

Don't use this repository. Use the official Buildroot repository
instead.

> I already tried a million different things. (different gcc version,
> different gettext, trying to build on ubuntu/debian) but it all comes down
> to this error after a while:

There are no errors in your e-mail.

> What can i do to get to the bottom of this ?
>
> If i go into the build/mono directory manually, and issue a .configure and
> make there, it compiles without errors.

Just don't do this: if you call the mono configure script manually
without all the proper environment variables and arguments, it will
build Mono for your host machine, and not for the target.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
_______________________________________________
buildroot mailing list
[hidden email]</user/SendEmail.jtp?type=node&node=104965&i=0>
http://lists.busybox.net/mailman/listinfo/buildroot


________________________________
If you reply to this email, your message will be added to the discussion below:
http://buildroot-busybox.2317881.n4.nabble.com/Buildroot-Mono-Compile-fails-on-mscorlib-tp104945p104965.html
To unsubscribe from Buildroot Mono Compile fails on mscorlib, click here<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=unsubscribe_by_code&node=104945&code=ci5zYWxvbW9uc0Byb3Blc29sdXRpb25zLm5sfDEwNDk0NXwxNzY4ODU2MTA4>.
NAML<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=macro_viewer&id=instant_html%21nabble%3Aemail.naml&base=nabble.naml.namespaces.BasicNamespace-nabble.view.web.template.NabbleNamespace-nabble.view.web.template.NodeNamespace&breadcrumbs=notify_subscribers%21nabble%3Aemail.naml-instant_emails%21nabble%3Aemail.naml-send_instant_email%21nabble%3Aemail.naml>




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Buildroot-Mono-Compile-fails-on-mscorlib-tp104945p104966.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150708/b9401ee5/attachment.html>
