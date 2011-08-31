From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 31 Aug 2011 15:33:21 +0200
Subject: [Buildroot] [PATCH v2 3/3] netsnmp: allow not to install MIB
	files
In-Reply-To: <4E5E2D90.2000307@lucaceresoli.net>
References: <1308152878-14593-1-git-send-email-luca@lucaceresoli.net>
 <201108301950.37244.yann.morin.1998@anciens.enib.fr>
 <4E5E2D90.2000307@lucaceresoli.net>
Message-ID: <201108311533.21541.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, Gustavo, All,

On Wednesday 31 August 2011 14:48:16 Luca Ceresoli wrote:
> Yann E. MORIN wrote:
> > Well, I'd do the other way around: if MIB files are to be installed, then
> > we need to be able to load them, so I'd do either:
[--SNIP--]
> The problem is net-snmp wants the MIBs installed when the MIB loading
> code is enabled, so this combination would be very annoying.

Ah, so this is a limitation of the net-snmp build system... OK.

> The use case you think about is that the user wants to provide his own
> MIB files. If he did, he would need to install also the base MIBs (the
> same installed by net-snmp), because it is impossible to load any MIB
> node without having the definition for the parent MIB nodes.

Yes, but I was merely thinking about using a whole set of altenative MIBs.

> So I think this use case would be so limited that it's not worth
> supporting it. At least not until anybody has this need.

Granted.

> So I think Gustavo's proposal is best: one option only to either enable
> both features or disable both.
> If you agree, I'll prepare a new patchset.

Yes, that's good for me. I was just saying that, in my point of view, the
dependency/select was in reverse order from a purely-logical point of view.
But your answer clarifies this, and Gustavoz' suggestion is even simpler,
and as you said, the alternative would be very seldom used, if at all, so
a single option perfectly makes sense. The user would then be free to
provide/overide its own set with the custom script that is run just prior
to building the images.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
