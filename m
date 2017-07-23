From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jul 2017 16:04:01 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-07-22
In-Reply-To: <CANQCQpb64q5cPLin8zVD9X0CinUiERF05xcf0kjrzXHrNMkkPw@mail.gmail.com>
 (Matthew Weber's message of "Sun, 23 Jul 2017 07:35:55 -0500")
References: <20170723063052.1CB8521DBF@mail.free-electrons.com>
 <CANQCQpa0--xE+_YtXVqfJr78i==sY0gj3fECTBKm7g-eByd9=Q@mail.gmail.com>
 <CANQCQpbvJMypP2s5rwTBPNsnhQ_akammE-ci4wpUqN=5mLeHRQ@mail.gmail.com>
 <CANQCQpb64q5cPLin8zVD9X0CinUiERF05xcf0kjrzXHrNMkkPw@mail.gmail.com>
Message-ID: <87lgnfntbi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

Hi,

 > It looks like all of the downloads of
 > https://www.grsecurity.net/~spender/paxtest-0.9.15.tar.gz on "gcc20"
 > and "free electrons server" consistently have a
 > GnuTLS: A TLS fatal alert has been received.
 > Unable to establish SSL connection.

 > That link is using HTTPS redirects.

 > I tested downloading "wget
 > https://www.grsecurity.net/~spender/paxtest-0.9.15.tar.gz" on my home
 > machine and a webbrowser, both seem to work ok.
 > My wget was "GNU Wget 1.17.1 ".

 > What OS version and/or wget/gnutls are those two machines using?
 > Google seems to note some issues with wget having a bug preventing
 > HTTPS redirections from working around the time of Debian7?

gcc20 is running Debian 7:

peko at gcc20:/tmp$ cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux 7 (wheezy)"
NAME="Debian GNU/Linux"
VERSION_ID="7"
VERSION="7 (wheezy)"
ID=debian
ANSI_COLOR="1;31"
HOME_URL="http://www.debian.org/"
SUPPORT_URL="http://www.debian.org/support/"
BUG_REPORT_URL="http://bugs.debian.org/"
peko at gcc20:/tmp$ wget https://www.grsecurity.net/~spender/paxtest-0.9.15.tar.gz
--2017-07-23 16:01:25--  https://www.grsecurity.net/~spender/paxtest-0.9.15.tar.gz
Resolving www.grsecurity.net (www.grsecurity.net)... 50.251.85.49
Connecting to www.grsecurity.net (www.grsecurity.net)|50.251.85.49|:443... connected.
GnuTLS: A TLS fatal alert has been received.
Unable to establish SSL connection.

But there's now a copy of the tarball on sources.buildroot.org, so these
older systems should just fall back to getting it from there.

-- 
Bye, Peter Korsgaard
