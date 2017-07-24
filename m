From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 09:16:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-07-22
In-Reply-To: <CANQCQpb64q5cPLin8zVD9X0CinUiERF05xcf0kjrzXHrNMkkPw@mail.gmail.com>
References: <20170723063052.1CB8521DBF@mail.free-electrons.com>
 <CANQCQpa0--xE+_YtXVqfJr78i==sY0gj3fECTBKm7g-eByd9=Q@mail.gmail.com>
 <CANQCQpbvJMypP2s5rwTBPNsnhQ_akammE-ci4wpUqN=5mLeHRQ@mail.gmail.com>
 <CANQCQpb64q5cPLin8zVD9X0CinUiERF05xcf0kjrzXHrNMkkPw@mail.gmail.com>
Message-ID: <20170724091608.294156f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 07:35:55 -0500, Matthew Weber wrote:

> Sorry that last email accidentally got sent.
> 
> It looks like all of the downloads of
> https://www.grsecurity.net/~spender/paxtest-0.9.15.tar.gz on "gcc20"
> and "free electrons server" consistently have a
> GnuTLS: A TLS fatal alert has been received.
> Unable to establish SSL connection.
> 
> That link is using HTTPS redirects.
> 
> I tested downloading "wget
> https://www.grsecurity.net/~spender/paxtest-0.9.15.tar.gz" on my home
> machine and a webbrowser, both seem to work ok.
> My wget was "GNU Wget 1.17.1 ".
> 
> What OS version and/or wget/gnutls are those two machines using?
> Google seems to note some issues with wget having a bug preventing
> HTTPS redirections from working around the time of Debian7?

I'm using:

$ wget --version
GNU Wget 1.13.4 built on linux-gnu.

on:

$ cat /etc/issue
Debian GNU/Linux 7 \n \l

Normally what happens in such situations is that after a while, Peter's
sources.buildroot.net fetches the tarball, it appears on
sources.buildroot.net, and that resolves the download issue. And it is
now the case: http://sources.buildroot.net/paxtest-0.9.15.tar.gz, so
the downloads should no longer fail, as all autobuilders will fall back
to sources.b.net.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
