From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Oct 2020 09:29:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: bump version to 18.9-Leia
In-Reply-To: <20201026212352.GF2805@scaer>
References: <20201025114959.561657-1-bernd.kuhls@t-online.de>
 <20201026220517.7a82f9f8@windsurf.home>
 <20201026212352.GF2805@scaer>
Message-ID: <20201027092910.7559c2ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 26 Oct 2020 22:23:52 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I guess there is a bit of "historical reasons" behind it.
> 
> However, there is a good technical reason: our package infrastructure
> can only build in one FOO_SUBDIR per pacakge, but here we have two:
> 
>   - tools/depends/native/JsonSchemaBuilder/
>   - tools/depends/native/TexturePacker/

Indeed. After a quick look, I thought this could be solved simply with
a custom BUILD_CMDS that invokes make in those two folders. But it's
more complicated: we would need a custom configure cmd that also calls
CMake in those two folders.

So, meh: what we have today is probably reasonable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
