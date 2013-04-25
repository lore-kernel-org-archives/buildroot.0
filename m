From: thomas <thomas.spitz@gmail.com>
Date: Thu, 25 Apr 2013 14:42:49 -0700 (PDT)
Subject: [Buildroot] Dropbear/SFTP
In-Reply-To: <871u9y9vqd.fsf@dell.be.48ers.dk>
References: <002401cded96$e8b13fa0$ba13bee0$@co.uk>
 <20130108130618.4991dff7@skate> <1366918894609-44233.post@n4.nabble.com>
 <87ip3a9yzi.fsf@dell.be.48ers.dk> <1366919482310-44235.post@n4.nabble.com>
 <871u9y9vqd.fsf@dell.be.48ers.dk>
Message-ID: <CA+QJksJKDeogdcxtJz8PNwmv-nDQuMpdoLHG55Kq54shV5wWFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Sorry for the novice question but I haven't manage to found the file where
I need to remove --with-libexecdir=/usr/lib

Searching with thomas at thomas-laptop:~/Armadeus/armadeus-5.2$ grep -Rn
"with-libexecdir=/usr/lib" *
 command, I found the following files :
...
 buildroot/output/target/var/log/ssh-diWeFpdL1576/agent.1576: No such
device or address
...
 buildroot/output/target/var/log/ssh-diWeFpdL1576/agent.1576: No such
device or address
...
Is it one of this file?
If not, how could I fix the problem by myself?

Thanks in advance
Best regards,
Thomas




2013/4/25 Peter Korsgaard-3 [via Buildroot (busybox)] <
ml-node+s2317881n44240h59@n4.nabble.com>

> >>>>> "thomas" == thomas  <[hidden email]<http://user/SendEmail.jtp?type=node&node=44240&i=0>>
> writes:
>
>  thomas> Hello Peter,
>  thomas> As I wrote, I'm not using dropbear anymore but openssh alone.
>
>  thomas> Here below my simple test:
>  thomas> thomas at thomas-laptop:~/Armadeus/armadeus-5.2$ sftp
> root at 192.168.1.5
>  thomas> root at 192.168.1.5's password:
>  thomas> sh: /usr/libexec/sftp-server: not found
>  thomas> Connection closed
>
>  thomas> Effectively, I have no /usr/libexec/sftp-server folder on my
>  thomas> target. Openssh didn't create it... Is there something manual
>  thomas> to do in order to activate sftp?
>
> Hmm, indeed. A quick test shows:
>
> make openssh
> ..
> /usr/bin/install -c -m 0755  sftp-server
> /home/peko/source/buildroot/output/target/usr/lib/sftp-server
> ..
>
> I guess it's because we're explicitly passing
> --with-libexecdir=/usr/lib. With that removed I see:
>
> /usr/bin/install -c -m 0755  sftp-server
> /home/peko/source/buildroot/output/target/usr/libexec/sftp-server
>
> Fixed in git, thanks for the report.
>
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> [hidden email] <http://user/SendEmail.jtp?type=node&node=44240&i=1>
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> ------------------------------
>  If you reply to this email, your message will be added to the discussion
> below:
>
> http://buildroot-busybox.2317881.n4.nabble.com/Dropbear-SFTP-tp38207p44240.html
>  To unsubscribe from Dropbear/SFTP, click here<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=unsubscribe_by_code&node=38207&code=dGhvbWFzLnNwaXR6QGdtYWlsLmNvbXwzODIwN3wxMjUwOTM0ODE5>
> .
> NAML<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=macro_viewer&id=instant_html%21nabble%3Aemail.naml&base=nabble.naml.namespaces.BasicNamespace-nabble.view.web.template.NabbleNamespace-nabble.view.web.template.NodeNamespace&breadcrumbs=notify_subscribers%21nabble%3Aemail.naml-instant_emails%21nabble%3Aemail.naml-send_instant_email%21nabble%3Aemail.naml>
>



-- 
<http://www.hestia-france.com/logiciels.html#Superviseur_domotique_Mitra><http://www.hestia-france.com><http://www.hestia-france.com/logiciels.html#Superviseur_domotique_Mitra><http://www.hestia-france.com/configurateur_ZENNIO_ZAS.php>
Hestia France S.A.S
*Fabricant de syst?mes domotiques et d'alarme pour l'habitat et le tertiaire
*
*Manufacturer of Home and Building Management System* *including alarm **
security*

2, rue du Z?cart - 59242 Templeuve - France
Tel: +33 (0)3 20 04 43 68 - Portable: +33 (0)6 26 87 13 93 - ID Skype:
hestia-france - Fax: +33 (0)3 20 64 55 02
 Site web: www.hestia-france.com - Email :
thomas.spitz at hestia-france.com<hestia@hestia-france.com>




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Dropbear-SFTP-tp38207p44250.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130425/c28a48cf/attachment.html>
