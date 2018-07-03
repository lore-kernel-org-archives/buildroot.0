From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 3 Jul 2018 09:19:18 -0300 (BRT)
Subject: [Buildroot] [PATCH 50/50] support/scripts: don't draw most of
 busybox' dependencies
In-Reply-To: <20180703114157.GD2530@scaer>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <d5b2e0eebf27fe994337e2c966f8ecf63849f3e1.1530565933.git.yann.morin.1998@free.fr>
 <1114006316.1182513.1530616827146.JavaMail.zimbra@datacom.com.br>
 <20180703114157.GD2530@scaer>
Message-ID: <613600301.1205374.1530620358013.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann Morin" <yann.morin.1998@free.fr>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Tuesday, July 3, 2018 8:41:57 AM
> Subject: Re: [Buildroot] [PATCH 50/50] support/scripts: don't draw most of busybox' dependencies

> Carlos, All,
> 
> On 2018-07-03 08:20 -0300, Carlos Santos spake thusly:
>> > From: "Yann Morin" <yann.morin.1998@free.fr>
>> > To: "buildroot" <buildroot@buildroot.org>
>> > Cc: "Yann Morin" <yann.morin.1998@free.fr>
>> > Sent: Monday, July 2, 2018 6:12:24 PM
>> > Subject: [Buildroot] [PATCH 50/50] support/scripts: don't draw most of busybox'
>> > dependencies
>> 
>> > Since most dependencies of busybox' are there to guarantee that busybox'
>> > does not install applets that are already provided by other packages,
>> > they are not really functional dependencies, and mostly clutter the
>> > dependency graph.
>> > 
>> > Only the dependencies on libraries are interested, so that is all we
>> > keep.
>> > 
>> > Even though that function is only called with pkg set to 'busybox', we
>> > still pass it as an argument, for symetry with the other functions that
>> > removes the dependencies of a package.
>> > 
>> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> > ---
>> > support/scripts/graph-depends | 10 ++++++++++
>> > 1 file changed, 10 insertions(+)
>> > 
>> > diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
>> > index 621e603278..909a3d4812 100755
>> > --- a/support/scripts/graph-depends
>> > +++ b/support/scripts/graph-depends
>> > @@ -181,6 +181,14 @@ def remove_mandatory_deps(pkg, deps):
>> >     return [p for p in deps[pkg] if p not in ['toolchain', 'skeleton']]
>> > 
>> > 
>> > +# This function removes all dependencies of busybox, except its
>> > +# dependencies on libraries (of which linux-pam) and host-pkgconf.
>>                                 ^^^^^^^^^^^^^^^^^^
>>                                    missing text?
> 
> No: linux-pam is a library too, But it belongs to the "libraries" ensemble, so I
> really meant to write what I wrote. :-)
> 
> It only gets a special mention because it does not start with 'lib'.

Ok, but the text looks a bit strange to me. What about something like
"dependencies on libraries (e.g. libpam, from linux-pam) ..."?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
