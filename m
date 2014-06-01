From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 1 Jun 2014 09:04:25 +0200
Subject: [Buildroot] [PATCH] reenable microblaze little endian for
 internal musl toolchain
In-Reply-To: <CAPALihOk0J7b7GWzth6AsiEm5KE7EZJ1w_XeSfRXbBvZ_Aa04Q@mail.gmail.com>
References: <20140531084556.GA17277@waldemar-brodkorb.de>
 <CAPALihPyH5erdhQOsTiQ7E2_La9AuTi_7ED5tUqpfph713sjWw@mail.gmail.com>
 <20140531234315.3cc32e4e@free-electrons.com>
 <CAPALihOk0J7b7GWzth6AsiEm5KE7EZJ1w_XeSfRXbBvZ_Aa04Q@mail.gmail.com>
Message-ID: <20140601070425.GA4197@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
William Welch wrote,

> Greetings,
> 
> Recall this is for 2014.05-rc3. ?I just ran through the process again.
> 
> All I did was make simple selection choices in menuconfig.
> 
> I did not manually enter any specifics about where/how to download the
> toolchain.
> 
> When I asked for an external toolchain, Musl was the only external toolchain
> listed.?

Try the internal buildroot toolchain and musl, this will work for
little endian targets. The external toolchain for musl is big endian
only and furthermore contains a bug, because musl 1.0 didn't work
for microblaze. At least not for qemu-system-microblazeel.
Rich Felker fixed the Bug after 1.0 release, after I reported it via
#musl on IRC.
 
best regards    
        Waldemar
