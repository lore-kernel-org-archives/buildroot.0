From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 May 2018 23:06:58 +0200
Subject: [Buildroot] [PATCH] package/nss-myhostname: Add package
In-Reply-To: <CAB2nKc8k8qc2=9vON1vzyJ0LwNAAkyLFm=kYUVahkwoLkQR7oA@mail.gmail.com>
 (Vincent Prince's message of "Fri, 25 May 2018 20:24:58 +0200")
References: <1527168341-29387-1-git-send-email-vincent.prince.fr@gmail.com>
 <87sh6f8y8t.fsf@dell.be.48ers.dk>
 <CAB2nKc8k8qc2=9vON1vzyJ0LwNAAkyLFm=kYUVahkwoLkQR7oA@mail.gmail.com>
Message-ID: <87k1rr8mx9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Prince <vincent.prince.fr@gmail.com> writes:

 > Hi Peter,
 > I'll send V2 on monday with:
 >   - patch split
 >   - DEVELOPERS
 >   - fix indentation
 >   - sha256 sig
 >   - AUTORECONF removed

Great, thanks.

 > nsswitch.conf resolve hosts in entries order, so it is important that it
 > resides after files and before the other entries.

Before the others?

The example on the website and note seems to show it at the very end,
E.G. as a fallback:

http://0pointer.de/lennart/projects/nss-myhostname/

It is recommended to put myhostname last in the nsswitch.conf line to
make sure that this mapping is only used as fallback, and any DNS or
/etc/hosts based mapping takes precedence.

 > Sed command comes from Yocto recipe
 > https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb

Ok, please mention that in the commit message - Thanks.

-- 
Bye, Peter Korsgaard
