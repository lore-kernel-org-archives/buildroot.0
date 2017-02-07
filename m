From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 15:41:27 +0100
Subject: [Buildroot] [PATCH] support/scripts: add script to test a
	package
In-Reply-To: <20170207093303.GB3578@free.fr> (Yann E. MORIN's message of "Tue, 
 7 Feb 2017 10:33:03 +0100")
References: <1486404173-31700-1-git-send-email-yann.morin.1998@free.fr>
 <508724e1-501e-4e44-6817-55bcdbf2f8ee@lucaceresoli.net>
 <20170207093303.GB3578@free.fr>
Message-ID: <87zihyqd0o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Luca, All,
 > On 2017-02-06 21:40 +0100, Luca Ceresoli spake thusly:
 >> On 06/02/2017 19:02, Yann E. MORIN wrote:
 > [--SNIP--]
 >> > +    printf ", olddefconfig"
 >> > +    if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
 >> > +        printf ": FAILED\n"
 >> > +        return
 >> > +    fi
 >> > +    while read line; do
 >> > +        if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then
 >> 
 >> I suggest removing the redirects and using 'grep -q' here.

 > grep -q is not POSIX. ;-)

But is that a real concern? We do use grep -q quite a bit already
(including in dependencies.sh):

git grep 'grep -q' | wc -l
46

-- 
Bye, Peter Korsgaard
