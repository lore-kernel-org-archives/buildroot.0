From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:33:11 +0100
Subject: [Buildroot] libcapn build failure
In-Reply-To: <56C3A2B8.5030309@proximus.be>
References: <56C1F90F.80804@proximus.be>
 <CAHXCMMJf4JHRKoCZ_B9eMWXf+rXX+xNgi=e2Qzm_mJi8ULBRvg@mail.gmail.com>
 <56C3A2B8.5030309@proximus.be>
Message-ID: <20160216233311.2c448df5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Sagaert,

On Tue, 16 Feb 2016 23:29:12 +0100, Johan Sagaert wrote:

> git clonehttps://github.com/adobkin/libcapn.git
> git submodule update --init      <<<---------- This downloads the jansson source.

We already have a jansson package in Buildroot, so you should rather
make your package "select" it, and then tweak your package so that it
uses the Buildroot-built jansson rather than its own internal copy.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
