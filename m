From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 23:46:45 +0100
Subject: [Buildroot] [PATCH] filter BR2_DEFCONFIG out of defconfig files
In-Reply-To: <CAAXf6LVM939GcFkXA6UkifUEs9H6sQnKgDqW8uBHQD3_JK0-OA@mail.gmail.com>
References: <1391523148-30887-1-git-send-email-jeremy.rosen@openwide.fr>
 <CAAXf6LVM939GcFkXA6UkifUEs9H6sQnKgDqW8uBHQD3_JK0-OA@mail.gmail.com>
Message-ID: <52F2BF55.3050200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/14 12:54, Thomas De Schampheleire wrote:
> Hi,
> 
> On Tue, Feb 4, 2014 at 3:12 PM, J?r?my Rosen <jeremy.rosen@openwide.fr> wrote:
>> When it is set, BR2_DEFCONFIG is saved like any config variable.
>> However, at this point it is a completely expanded, absolute path
>> It is not a good idea to save absolute paths in defconfig files
>> moreover it makes little sense to save the defconfig location
>> within the defconfig
> 
> The entire BR2_DEFCONFIG mechanism has never done what I expected.
> What I want is that 'make savedefconfig' (or a similar command) saves
> the configuration back to where it originated from. BR2_DEFCONFIG does
> more or less that, but only if you set the configuration initially
> with 'make defconfig BR2_DEFCONFIG=...' instead of the normal 'make
> xxxx_defconfig'. Isn't this possible to achieve?

 Sure, quite easily. However, is that really what we want?


make rpi_defconfig
add some packages
test test test
add more packages
test test test
make savedefconfig

Oops I've just overwritten rpi_defconfig.


 It's probably what you want when using BR2_EXTERNAL, but not when using
a buildroot defconfig. Unless, of course, you don't use BR2_EXTERNAL but
add directly to the buildroot directory...


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
