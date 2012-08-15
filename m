From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 15 Aug 2012 17:39:07 +0200
Subject: [Buildroot] Open question: remove "toolchain on target" option
In-Reply-To: <201208150456.03396.minimod@morethan.org>
References: <20120811202114.3a95d4ab@skate>
 <201208150456.03396.minimod@morethan.org>
Message-ID: <201208151739.08150.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On Wednesday 15 August 2012 11:56:00 Michael S. Zick wrote:
> To re-cap:
> Once upon a time, it was decided that crosstool-ng be integrated with
> Buildroot with the eventual goal of making it the replacement for the
> internal BR toolchain generation.
> 
> Time passes (over a year now if memory serves) and the integration of
> crosstool-ng is in a well developed state.

There still are small issues to overcome before it can replace the
internal backend.

> crosstool-ng was never intended to do Canadian Cross toolchain builds.

Yes it was. But note that what Thomas suggests is to remove the "native
toolchain on target" (aka cross-native), which is not a canadian cross:
  - canadian:     build ? host ? target
  - cross-native: build ? host = target

crosstool-NG can do canadian-cross, but not (yet) cross-native.

> The (old) BR toolchain generation can only create uClibc based toolchains.
> 
> To complete that long-ago set project development goal means dropping the
> (old) BR toolchain generation.

See above, not completely ready.

> Which means, as a side effect, dropping the ability to generate a native
> toolchain for the target (the (old) internal toolchain generator is the
> only one that can do something like a Canadian Cross).

Nope, that's not a canadian-cross.

> For this proposal, I'll ignore bit-rot, bit-rot "just happens" to everything.
> 
> Moving forward:
[--SNIP--]
> Add an external CanadianCross-ng build support, as crosstool-ng once was,
> prior to its integration.

I'm not sure I understood that sentence...
Maybe, the solution would be to add the cross-native suport to ct-ng.

For the records, in the crosstool-NG menuconfig, you'll see that choice:

  Toolchain options  --->
    Type (Cross)  --->
      ( ) Native       (NO CODE!) (EXPERIMENTAL)
      (X) Cross
      ( ) Cross-native (NO CODE!) (EXPERIMENTAL)
      ( ) Canadian     (EXPERIMENTAL)

So, it is provisioned that ct-ng can do a cross-native, which is what
buildroot calls "native toolchain on target". Just that I did not have
the pressing need for such a toolchain, and that I did not have free
time to do it, and that no one submitted any patch. ;-)

Ultimately, that would be nice to have at least cross-native supported
(native is not that important, I think). But it will require some changes
wrt how sysroot is handled in ct-ng: a native toolchain is *not* sysrooted.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
