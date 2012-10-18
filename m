From: David Sanchez Herrero <david.krusty@gmail.com>
Date: Thu, 18 Oct 2012 01:24:51 -0700 (PDT)
Subject: [Buildroot] Local SVN respository
In-Reply-To: <1350547544.8368.8.camel@john-ubu>
References: <1350547544.8368.8.camel@john-ubu>
Message-ID: <CAMPeO9x3sHtbnjw3comWwnYwiL5Fwd+zmSZdmBwziDxkYScOeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is only an idea as a workaround, and I'm not sure if it could work, but you
can try to add to the host file a line with the URL of the remote
repository pointing to localhost. This will make Buildroot access the local
repository when it tries to access the remote one.


Greetings, David.

2012/10/18 john [via Buildroot (busybox)] <
ml-node+s2317881n33259h70@n4.nabble.com>

>
> Hi,
>
> I am trying to build a local package from a local svn repository. The
> software I am building is a heavily hacked version of some open source
> package. I am trying to retrieve the software from a local svn
> repository (svn:// and not http) but buildroot keeps fetching the
> official version of the software rather than my local copy. I have tried
> various options like _OVERRIDE_SRCDIR but cannot change this behaviour,
> any suggestions?
>
> An extract from my mk file follows:
>
> MYPACKAGE_VERSION = 1.0.1
>
> #This should fetch it from an SVN repository and create
> mysoftware-1.0.1.tar.gz in the dl directory
> MYPACKAGE_SITE=svn://myserver/mydir/trunk/mysoftware-1.0.1/
>
> #MYPACKAGE_SITE_METHOD = svn
>
> #MYPACKAGE_OVERRIDE_SRCDIR =
> ${BUILDROOT_LOCATION}/../../mydir/mysoftware-1.0.1/
>
> #This should take  mysoftware-1.0.1.tar.gz directly from the dl
> directory and place it in output/build/mysoftware directory
> MYPACKAGE_SOURCE = mysoftware-$(MYPACKAGE_VERSION).tar.gz
>
> _______________________________________________
> buildroot mailing list
> [hidden email] <http://user/SendEmail.jtp?type=node&node=33259&i=0>
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> ------------------------------
>  If you reply to this email, your message will be added to the discussion
> below:
>
> http://buildroot-busybox.2317881.n4.nabble.com/Local-SVN-respository-tp33259.html
>  To unsubscribe from Buildroot (busybox), click here<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=unsubscribe_by_code&node=2&code=ZGF2aWQua3J1c3R5QGdtYWlsLmNvbXwyfC02MDk3MjQ4ODk=>
> .
> NAML<http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=macro_viewer&id=instant_html%21nabble%3Aemail.naml&base=nabble.naml.namespaces.BasicNamespace-nabble.view.web.template.NabbleNamespace-nabble.view.web.template.NodeNamespace&breadcrumbs=notify_subscribers%21nabble%3Aemail.naml-instant_emails%21nabble%3Aemail.naml-send_instant_email%21nabble%3Aemail.naml>
>




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Local-SVN-respository-tp33259p33260.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121018/970bc42a/attachment.html>
