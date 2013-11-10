From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 23:42:03 +0100
Subject: [Buildroot] [PATCH 1/1] Generation of locales: made call to tr
	more robust and added LOWERCASE macro
In-Reply-To: <1384104772-30097-1-git-send-email-thierry.bultel@wanadoo.fr>
 (Thierry Bultel's message of "Sun, 10 Nov 2013 18:32:52 +0100")
References: <1384104772-30097-1-git-send-email-thierry.bultel@wanadoo.fr>
Message-ID: <87wqkfc210.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thierry" == Thierry Bultel <thierry.bultel@wanadoo.fr> writes:

> When calling 'tr' without quoting braces, bash can make really weird things
> if there are existing 'single-letter-named' directories
> eg:
> thierry at thierry-desktop:~$ echo AAA | tr [A-Z] [a-z] 
> aaa
> thierry at thierry-desktop:~$ mkdir m
> thierry at thierry-desktop:~$ echo AAA | tr [A-Z] [a-z] 
> AAA


> The (quick) analysis is that the callee (tr) argvs then
> contain 'm' thus the translation does not work

> Using quotes works around it:
> thierry at thierry-desktop:~$ echo AAA | tr '[A-Z]' '[a-z]' 
> aaa


> Changes v1->v2
>   - Added the LOWERCASE macro, following Thomas De Schampheleire's advice

Committed, thanks.

-- 
Bye, Peter Korsgaard
