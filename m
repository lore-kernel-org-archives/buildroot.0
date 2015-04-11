From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 20:18:05 +0200
Subject: [Buildroot] [PATCH v2 1/1] xserver_xorg-server: Change default
 to X.org modular server
In-Reply-To: <20150411181330.GL4221@free.fr>
References: <1428772436-16962-1-git-send-email-bernd.kuhls@t-online.de>
 <20150411195842.52a58aff@free-electrons.com>
 <20150411181330.GL4221@free.fr>
Message-ID: <20150411201805.4bac425d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 11 Apr 2015 20:13:30 +0200, Yann E. MORIN wrote:

> I would not mind much doing the switch to the modular Xserver by
> default. But that would mean proper dependency propagation (i.e. C++).

I don't understand what you mean here.

> However, an alternative solution would be to remove the 'default' clause
> altogether from the choice:
> 
>   - if C++ is available, the modular Xserver is enabled by default,
>     being the first option in the choice;
> 
>   - if C++ is not enabled, then KDrive is enabled, being the only option
>     in the choice.

Well, Bernd's patch is doing that in a perfectly fine way. If C++ is
available, the default on modular will work. If C++ is not available,
since the modular option will not be available, the only remaining
option in the choice will be Kdrive, and it will be the selected option.

Am I missing something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
