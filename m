From: salorob <r.salomons@ropesolutions.nl>
Date: Wed, 8 Jul 2015 06:57:39 -0700 (PDT)
Subject: [Buildroot] Buildroot Mono Compile fails on mscorlib
In-Reply-To: <20150708140347.223be2e4@free-electrons.com>
References: <1436336880640-104945.post@n4.nabble.com>
 <20150708135209.18da05f9@free-electrons.com>
 <D1C2DD1B.197E2%r.salomons@ropesolutions.nl>
 <20150708140347.223be2e4@free-electrons.com>
Message-ID: <D1C2FD1C.19800%r.salomons@ropesolutions.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi There,

I tried building with the mono and monolite packages from the 2015_08 build root. But that won?t work either.
I?m using another build root version: 2014_02

I can imaging i can?t just take this and that from different versions, but I thought 2 packages mono might not be so harmfull.
Probably I?m missing a library, or a config thing, but I don?t know what?

Config file is attached, and here is the error output once again:

make[3]: Leaving directory `/home/parallels/ICnova_2014_02/output/build/host-mono-4.0.0/data'
Making all in runtime
make[3]: Entering directory `/home/parallels/ICnova_2014_02/output/build/host-mono-4.0.0/runtime'
if test -w /home/parallels/ICnova_2014_02/output/build/host-mono-4.0.0/mcs; then :; else chmod -R +w /home/parallels/ICnova_2014_02/output/build/host-mono-4.0.0/mcs; fi
cd /home/parallels/ICnova_2014_02/output/build/host-mono-4.0.0/mcs && /usr/bin/make --no-print-directory -s NO_DIR_CHECK=1 PROFILES='binary_reference_assemblies net_4_5 xbuild_12 xbuild_14   ' CC='/usr/bin/gcc' all-profiles
make[7]: mcs: Command not found
make[7]: *** [build/deps/basic-profile-check.exe] Error 127
*** The compiler 'mcs' doesn't appear to be usable.
*** Trying the 'monolite' directory.
Bootstrap compiler: Mono C# compiler version 4.1.0.0
MCS     [net_4_5] mscorlib.dll

Unhandled Exception:
Nested exception detected.
Original Exception: at Mono.CSharp.Driver.Main (string[]) <0x00048>

Nested exception:at System.Threading.Thread.get_CurrentThread () <0x00025>
at System.Globalization.NumberFormatInfo.get_CurrentInfo () <0x00008>
at System.Globalization.NumberFormatInfo.GetInstance (System.IFormatProvider) <0x00069>
at int.ToString (string,System.IFormatProvider) <0x00026>
at string.FormatHelper (System.Text.StringBuilder,System.IFormatProvider,string,object[]) <0x0055f>
at System.Text.StringBuilder.AppendFormat (System.IFormatProvider,string,object[]) <0x0001b>
at System.Text.StringBuilder.AppendFormat (string,object) <0x00052>
at System.Exception.AddFrames (System.Text.StringBuilder,string,string,System.Diagnostics.StackTrace) <0x00249>
at System.Exception.get_StackTrace () <0x0016b>
at System.Exception.ToString () <0x0010a>
at System.Exception.ToString () <0x000c4>


[ERROR] FATAL UNHANDLED EXCEPTION: Nested exception detected.
Original Exception: at Mono.CSharp.Driver.Main (string[]) <0x00048>

Nested exception:at System.Threading.Thread.get_CurrentThread () <0x00025>
at System.Globalization.NumberFormatInfo.get_CurrentInfo () <0x00008>
at System.Globalization.NumberFormatInfo.GetInstance (System.IFormatProvider) <0x00069>
at int.ToString (string,System.IFormatProvider) <0x00026>
at string.FormatHelper (System.Text.StringBuilder,System.IFormatProvider,string,object[]) <0x0055f>
at System.Text.StringBuilder.AppendFormat (System.IFormatProvider,string,object[]) <0x0001b>
at System.Text.StringBuilder.AppendFormat (string,object) <0x00052>
at System.Exception.AddFrames (System.Text.StringBuilder,string,string,System.Diagnostics.StackTrace) <0x00249>
at System.Exception.get_StackTrace () <0x0016b>
at System.Exception.ToString () <0x0010a>
at System.Exception.ToString () <0x000c4>


make[9]: *** [../../class/lib/net_4_5/mscorlib.dll] Error 1
make[8]: *** [do-all] Error 2
make[7]: *** [all-recursive] Error 1
make[6]: *** [all-recursive] Error 1
make[5]: *** [profile-do--net_4_5--all] Error 2
make[4]: *** [profiles-do--all] Error 2
make[3]: *** [all-local] Error 2
make[3]: Leaving directory `/home/parallels/ICnova_2014_02/output/build/host-mono-4.0.0/runtime'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/parallels/ICnova_2014_02/output/build/host-mono-4.0.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/parallels/ICnova_2014_02/output/build/host-mono-4.0.0'
make: *** [/home/parallels/ICnova_2014_02/output/build/host-mono-4.0.0/.stamp_built] Error 2


Thanks in advance,

From: "Thomas Petazzoni-2 [via Buildroot ] (busybox)" <ml-node+s2317881n104967h62 at n4.nabble.com<mailto:ml-node+s2317881n104967h62@n4.nabble.com>>
Date: woensdag 8 juli 2015 13:41
To: Robert Salomons <r.salomons at ropesolutions.nl<mailto:r.salomons@ropesolutions.nl>>
Subject: Re: Buildroot Mono Compile fails on mscorlib

Hello,

On Wed, 8 Jul 2015 04:38:06 -0700 (PDT), salorob wrote:

> Well, the post was created online, for some reason it didn't email the bits between the <raw> tags.
>
> I'll try the packages from the original repository first, and will get back with that.

Yes, please try the official Buildroot, and if you get a build failure,
make sure to include in your report: 1/ the exact Buildroot version you
have used and 2/ a minimal Buildroot .config file that exhibits the
issue so that we can easily reproduce.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
_______________________________________________
buildroot mailing list
[hidden email]</user/SendEmail.jtp?type=node&node=104967&i=0>
http://lists.busybox.net/mailman/listinfo/buildroot


________________________________
If you reply to this email, your message will be added to the discussion below:
http://buildroot-busybox.2317881.n4.nabble.com/Buildroot-Mono-Compile-fails-on-mscorlib-tp104945p104967.html
To unsubscribe from Buildroot Mono Compile fails on mscorlib, click here<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=unsubscribe_by_code&node=104945&code=ci5zYWxvbW9uc0Byb3Blc29sdXRpb25zLm5sfDEwNDk0NXwxNzY4ODU2MTA4>.
NAML<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=macro_viewer&id=instant_html%21nabble%3Aemail.naml&base=nabble.naml.namespaces.BasicNamespace-nabble.view.web.template.NabbleNamespace-nabble.view.web.template.NodeNamespace&breadcrumbs=notify_subscribers%21nabble%3Aemail.naml-instant_emails%21nabble%3Aemail.naml-send_instant_email%21nabble%3Aemail.naml>


config (53K) <http://buildroot-busybox.2317881.n4.nabble.com/attachment/104976/0/config>




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Buildroot-Mono-Compile-fails-on-mscorlib-tp104945p104976.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150708/807d0a39/attachment.html>
