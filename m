From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Apr 2017 00:09:41 +0200
Subject: [Buildroot] [PATCH 1/7] package configs: clean up indentation
 warnings.
In-Reply-To: <CAFSsvmrVYi1gn-U1Zk=+F2+aazno9_FSdci_KZ39P87K3OXN5Q@mail.gmail.com>
References: <20170421152452.11236-1-aduskett@codeblue.com>
 <20170422155352.7c6cca5a@free-electrons.com>
 <CAFSsvmrVYi1gn-U1Zk=+F2+aazno9_FSdci_KZ39P87K3OXN5Q@mail.gmail.com>
Message-ID: <04cd56df-3ec2-ad44-6a3b-184c3e736d27@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-04-17 18:47, Adam Duskett wrote:
> Hello;
> 
> On Sat, Apr 22, 2017 at 9:53 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Fri, 21 Apr 2017 11:24:46 -0400, Adam Duskett wrote:
>>> The check-package script when ran gave warnings on indentation issues
>>> on all of these Config files.  This patch cleans up all warnings
>>> related to the indentation of the Config files in the package directory.
>>>
>>> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
>>> ---
>>>  package/b43-firmware/Config.in       |   8 +-
>>>  package/binutils/Config.in.host      |  12 +-
>>>  package/gcc/Config.in.host           | 156 +++++------
>>>  package/gdb/Config.in.host           |  12 +-
>>>  package/jquery-ui-themes/Config.in   |  96 +++----
>>>  package/kodi/Config.in               | 100 +++----
>>>  package/linux-headers/Config.in.host |  85 +++---
>>>  package/lua/Config.in                |  12 +-
>>>  package/uclibc/Config.in             |  28 +-
>>>  package/x11r7/Config.in              | 526 ++++++++++++++++++-----------------
>>>  10 files changed, 522 insertions(+), 513 deletions(-)
>>
>> This looks good overall, except for package/Config.in. The indentation
>> is done on purpose in this file, I believe so that "diff" puts some
>> useful text in the context, making the patches touching
>> package/Config.in easier to read.
>>
>> So please drop the change to package/Config.in.
>>
> Not sure what you mean? I don't see package/Config.in in this patch?

 He means package/x11r7/Config.in, which like package/Config.in is just a list
of menu and source lines. Like Thomas said, the indentation is useful so that a
diff shows in which menu entry something is changed (usually, a package is added).

 However, it currently doesn't work for package/x11r7/Config.in, because git
identifies the "if BR2_PACKAGE_XORG7" as the 'function' instead of the menu.
Also, for x11r7, the reasoning of seeing the menu isn't so important, since the
package name already tells the story (it starts with xlib_, xdriver_, xapp_, etc.)

 Anyway, the x11r7 bit should certainly be a separate patch.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
