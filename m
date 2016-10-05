From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 21:30:18 +0200
Subject: [Buildroot] [PATCH v2 04/20] python3: make it exclusive from
 python
In-Reply-To: <8nrfcdx2pk.ln2@ID-313208.user.individual.net>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <8nrfcdx2pk.ln2@ID-313208.user.individual.net>
Message-ID: <20161005213018.7a5567da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 05 Oct 2016 20:00:40 +0200, Bernd Kuhls wrote:

> sorry for warming up this old commit but I would like to ask whether it 
> is possible at all to allow python2 and python3 together on the target?

No, this is not possible, because we have no way in kconfig to say
which Python modules should be installed for python2, and which Python
modules should be installed for python3.

So while having both interpreters and the Python standard library
side-by-side would work, it doesn't work for all the external Python
modules we have.

> I need python2 for Kodi, afaics[1] there are no current plans to support 
> python3.

I think that's the main problem. Staying on python2 only is really not
a wise choice.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
