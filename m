From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Oct 2018 08:43:18 +0200
Subject: [Buildroot] Connection refused error
In-Reply-To: <CAD8kTsAZSoQQ3d-MX2u8CpqpahFbUYgJqoM92uoqcfHEDHg4DQ@mail.gmail.com>
References: <CAD8kTsAZSoQQ3d-MX2u8CpqpahFbUYgJqoM92uoqcfHEDHg4DQ@mail.gmail.com>
Message-ID: <20181017084318.5a69f4ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Oct 2018 16:27:23 -0700, Shaikat Hossain wrote:
> I am receiving the following error when I run make on the Erpiam project I
> am building from Github:
> 
> "
> shaikat at shaikat-VirtualBox:~/erpiam$ make
> >>> host-expat 2.2.5 Downloading  
> --2018-10-16 15:59:34--
> http://downloads.sourceforge.net/project/expat/expat/2.2.5/expat-2.2.5.tar.bz2
> Connecting to 127.0.0.1:8080... failed: Connection refused.

You probably have some wrong http_proxy variable: it tries to connect
to 127.0.0.1 (i.e localhost) on port 8080. This seems to have nothing to
do with Buildroot, but rather with a broken wget configuration on your
system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
