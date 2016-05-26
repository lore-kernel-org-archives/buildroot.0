From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 20:35:17 +0200
Subject: [Buildroot] Genimage last partition size issue
In-Reply-To: <871t4rcuv1.fsf@dell.be.48ers.dk>
References: <CANQCQpb634S9qdGcoZubqLcpFupyLyD8a=5hEOOXiNeOq1Vsrw@mail.gmail.com>
 <871t4rcuv1.fsf@dell.be.48ers.dk>
Message-ID: <20160526203517.1a2a3670@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 May 2016 17:56:50 +0200, Peter Korsgaard wrote:

> How should genimage know what the size is of your SD card when you
> generate the foo.img image? I guess you would need to add size = 4G
> inside image foo.img { }, but notice that this is isn't very efficient
> as you will be writing lots of zeros to the sd card.

Isn't it possible to generate a sparse file, and then use the sparse
capability of dd to avoid writing those lots of zeros?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
