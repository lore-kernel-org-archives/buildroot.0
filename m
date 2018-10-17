From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Oct 2018 08:44:41 +0200
Subject: [Buildroot] Connection refused error
In-Reply-To: <CAD8kTsAZSoQQ3d-MX2u8CpqpahFbUYgJqoM92uoqcfHEDHg4DQ@mail.gmail.com>
 (Shaikat Hossain's message of "Tue, 16 Oct 2018 16:27:23 -0700")
References: <CAD8kTsAZSoQQ3d-MX2u8CpqpahFbUYgJqoM92uoqcfHEDHg4DQ@mail.gmail.com>
Message-ID: <878t2xysva.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Shaikat" == Shaikat Hossain <shossa3@gmail.com> writes:

 > I am receiving the following error when I run make on the Erpiam project I
 > am building from Github:

 > "
 > shaikat at shaikat-VirtualBox:~/erpiam$ make
 >>>> host-expat 2.2.5 Downloading
 > --2018-10-16 15:59:34--
 > http://downloads.sourceforge.net/project/expat/expat/2.2.5/expat-2.2.5.tar.bz2
 > Connecting to 127.0.0.1:8080... failed: Connection refused.
 > --2018-10-16 15:59:34--  http://sources.buildroot.net/expat-2.2.5.tar.bz2
 > Connecting to 127.0.0.1:8080... failed: Connection refused.

You seem to have a proxy configured for 127.0.0.1:8080 but it isn't
working. Either fix that or remove the proxy configuration (probably an
http_proxy / https_proxy environment variable).

-- 
Bye, Peter Korsgaard
