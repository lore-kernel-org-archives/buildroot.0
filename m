From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Oct 2017 12:43:46 +0200
Subject: [Buildroot] [PATCH 2/4] grub2: introduce BR2_TARGET_GRUB2_CFG
In-Reply-To: <20171022115901.44ab9855@windsurf>
References: <20171022093842.21788-1-nunes.erico@gmail.com>
 <20171022093842.21788-3-nunes.erico@gmail.com>
 <20171022115901.44ab9855@windsurf>
Message-ID: <cfe84eb2-cdd3-aab0-ef49-26575d74cdd3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-10-17 11:59, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 22 Oct 2017 11:38:40 +0200, Erico Nunes wrote:
>> This config can be used to provide a custom Grub 2 configuration file
>> containing menu entries. Previously, this had to be always done by an
>> external script which would overwrite the default file.
>> This is backwards compatible for existing configs as the default value
>> is the previously hardcoded value.
>>
>> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> I think we had similar proposals in the past (but perhaps it was for
> grub legacy, not grub2), and I believe our answer was that this config
> file can be trivially replaced in a post-build hook or rootfs overlay,
> because it is not used during the grub2 build process.
> 
> Hence a separate option is not really needed because you can already do
> that easily with a post-build or a rootfs overlay.
> 
> So, I'm not saying no entirely, but I'm not sure there is really a huge
> benefit in having a separate option for this.

 I agree.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
