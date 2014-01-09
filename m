From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 09 Jan 2014 18:01:24 +0100
Subject: [Buildroot] ParaGUI package?
In-Reply-To: <20140108113404.413a4685@skate>
References: <DC148C5AA1CEBA4E87973D432B1C2D8817E678D7@P3PWEX4MB008.ex4.secureserver.net>
 <20140108113404.413a4685@skate>
Message-ID: <52CED5E4.90603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/01/14 04:34, Thomas Petazzoni wrote:
> Dear Hartley Sweeten,
>
> On Wed, 8 Jan 2014 00:10:29 +0000, Hartley Sweeten wrote:
>
>> I'm trying to find a simple GUI library that can be used with SDL and this one appears
>> to cover my needs. Unfortunately the ParaGUI library appears to be a bit dead. The
>> latest release at http://download.savannah.gnu.org/releases/paragui/ is
>>
>> paragui-1.1.8.tar.gz	19-Oct-2004
>>
>> I found a newer branch on https://github.com/pipelka/paragui that appears to be
>> version 1.1.11.
>
> My first reaction is: do you really want to start using something that
> appears to be dead/deprecated?
>
>> Makefile.am: error: required file './NEWS' not found
>> Makefile.am: error: required file './ChangeLog' not found
>
> These seems to be the real problems. Easiest solution is to add a post
> patch hook with "touch $(@D)/NEWS $(@D)/ChangeLog"

  Actually, perhaps we should always to this when PKG_AUTORECONF is YES? 
There are quite a lot of packages that have this touch trick.

  Regards,
  Arnout

>
> A cleaner solution is to add the "foreign" option in the
> AM_INIT_AUTOMAKE call in configure.in, like:
>
> AM_INIT_AUTOMAKE([1.10 no-define foreign])
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
