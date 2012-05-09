From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 9 May 2012 10:06:20 +0200
Subject: [Buildroot] [PATCH 0/3] Add CONF_ENABLE and CONF_PKG_ENABLE
 helper functions
In-Reply-To: <20120507162139.44a814e9@skate>
References: <1335647781-16536-1-git-send-email-arnout@mind.be>
 <20120507162139.44a814e9@skate>
Message-ID: <CAAXf6LVpk6NEbnC9pBono-H9wXj9OBdEhttD2N-s5mbPHJs_7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 7, 2012 at 4:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Arnout,
>
> Le Sat, 28 Apr 2012 23:16:18 +0200,
> "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :
>
>> ?Many packages have the following type of construct:
>>
>> ifeq ($(BR2_PACKAGE_ACL),y)
>> ? ? ? ?SYSTEMD_CONF_OPT += --enable-acl
>> ? ? ? ?SYSTEMD_DEPENDENCIES += acl
>> else
>> ? ? ? ?SYSTEMD_CONF_OPT += --disable-acl
>> endif
>>
>> ?The first patch in this series abbreviates that to
>>
>> $(eval $(call CONF_PKG_ENABLE,SYSTEMD,acl))
>>
>> ?It makes it possible to abbreviate similar constructs as well.
>
> Thanks for working on this and making a proposal.
>
> However, on my side, I am not yet convinced that this is actually
> making things better than what we have now. What we have now is quite
> obvious for the first-time reader, which is very good. Those
> CONF_PKG_ENABLE and CONF_ENABLE macros make things a bit too cryptic
> from my point of view. This is not an absolutely strong opinion, but I
> have the feeling this is on the "we want to make things smaller/shorter
> and end up making things cryptic" side of the trade-off. Of course,
> others have to comment to share their views on this.

I tend to agree with Thomas that it makes things less obvious for
regular users. The relation between such a CONF_PKG_ENABLE statement
and the corresponding options passed to the configure script is not
apparent, which confuses people.
