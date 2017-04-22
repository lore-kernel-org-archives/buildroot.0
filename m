From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Apr 2017 00:19:08 +0200
Subject: [Buildroot] [PATCH v5 07/34] package/kodi-texturepacker: new
 host package
In-Reply-To: <20170422092650.GH15086@scaer>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-8-bernd.kuhls@t-online.de>
 <20170422092650.GH15086@scaer>
Message-ID: <e597f43c-aad0-f3a2-b527-a2f6ba2cb526@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-04-17 11:26, Yann E. MORIN wrote:
> Bernd, All,
> 
> On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
>> Needed for upcoming kodi version bump to 17.1-Krypton which will also
>> switch the kodi build system to CMake.
> And now I see why you did not introduce a host-variant of Kodi: you need
> two tools from it, and they are in different subdirs.

 ... and you don't want to build all of Kodi for the host.

 Still, I think it might be easier to treat the host version as a generic
package, and call cmake and make explicitly, once for each tool.


> I still find it a bit of disapointing that the Kodi buildsystem can not
> build its own tools... :-(

 Or indeed, patch Kodi's CMakeLists.txt so it can build its own build tools.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
