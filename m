From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Jun 2017 14:17:29 +0200
Subject: [Buildroot] [PATCH 2/5] libssl: new virtual package.
In-Reply-To: <CAFSsvmpY_6C-AzvJDMG6b-kDs0MQCHQivtx0U49NFSM0rwN-Pw@mail.gmail.com>
References: <20170615142928.31927-1-aduskett@codeblue.com>
 <20170615142928.31927-2-aduskett@codeblue.com>
 <20170615232816.121a18b9@windsurf.lan>
 <bf80e20f-0e71-258b-a60f-2b01f6f46909@mind.be>
 <CAFSsvmrQLDmptGh8PoUgG0rO2VkVQYNOXJw4QzxKYox5M0LLTQ@mail.gmail.com>
 <CAFSsvmoo3ceMdMonxoB453M3=w+NMRTw9EZ5i=nR1x5d1+a7cA@mail.gmail.com>
 <CAFSsvmpY_6C-AzvJDMG6b-kDs0MQCHQivtx0U49NFSM0rwN-Pw@mail.gmail.com>
Message-ID: <20170622141729.74baae24@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Jun 2017 07:32:45 -0400, Adam Duskett wrote:
> So after thinking about this for a bit, I would like to also bring up
> the topic of BoringSSL.
> BoringSSL is gaining some traction, and I would like to also import it
> into Buildroot pretty soon.
> That would leave Buildroot with three possible SSL libraries.  Unlike
> LibreSSL, BoringSSL does not
> try to maintain backwards compatibility with OpenSSL.  However many
> programs such as Janus-Gateway
> now offer support for BoringSSL.

If there's no compatibility between BoringSSL and OpenSSL/LibreSSL,
then I guess BoringSSL shouldn't be a provider of the "ssl/libssl"
virtual package. Instead, each package that can use should be able to
use it as an alternative to the ssl/libressl virtual package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
