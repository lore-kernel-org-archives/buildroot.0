From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Mar 2019 17:11:31 +0100
Subject: [Buildroot] [PATCH v2] make printvars: avoid invalid calls when
 arguments are missing
In-Reply-To: <869DDE67-B3D6-4EFB-8007-B5D128969431@posteo.de>
References: <20190303114916.28824-1-martink@posteo.de>
 <20190303132329.GH2721@scaer>
 <869DDE67-B3D6-4EFB-8007-B5D128969431@posteo.de>
Message-ID: <20190303161131.GI2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2019-03-03 14:57 +0100, Martin Kepplinger spake thusly:
> Am 3. M?rz 2019 14:23:29 MEZ schrieb "Yann E. MORIN" <yann.morin.1998@free.fr>:
> >Martin, All,
> >
> >On 2019-03-03 12:49 +0100, Martin Kepplinger spake thusly:
> >> during "make printvars > compare" the following error occurs -
> >> reproducible after any "make *_defconfig":
> >> 
> >> /bin/bash: support/dependencies/check-host-.sh: no such file or
> >directory
> >> /bin/bash: -c: line 0: syntax error: ')' unexpected
> >> /bin/bash: -c: line 0: `set -e; TMP="$(mktemp)"; if () >/dev/null
> >2>&1; then echo ""; else echo ""; fi;
[--SNIP--]
> >In my opinion, whe should not try to hide those messages, because:
> >
> >  * it makes the code heavier and harder to read and maintain. For
> >    example, the next developer who looks at try-run would be very
> >    tempted to wonder why-on-earth that macro tests whether it has
> >    an argument (i.e. it is called or evaluated), as this is not
> >    customary to do so, usually, and thus they would be tempted, and
> >    rightfully so, to send a patch to remove the test.
> >
> >  * it is easy to add even more such macros, either in the infra or in
> >   packages, and especially in packages in br2-external, and there will
> >   always be such spurious error messages, because see above, it is not
> >    customary to test the macro parameters.
> >
> >So, I'd be tempted to just live with that situation, and add a small
> >explanation why there might be errors, and list the usual ones.
> 
> I totally think so too. Could you add a note about this to the docs?

Since you raised the topic, you can as well do that change in the docs.
The manual is in the Buildroot tree, in docs/manual/. You will want to
have a look at docs/manual/make-tips.txt which documents and explains
printvars, extend that with a note about the spurious errors, and send a
patch.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
