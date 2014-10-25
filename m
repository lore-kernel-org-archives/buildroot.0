From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 18:49:27 +0200
Subject: [Buildroot] [PATCH v2 1/1] shairplay-sync: new package
In-Reply-To: <56aabaa3604876fb38ac9833169f1b88@posteo.de>
References: <1414191341-21557-1-git-send-email-jkrause@posteo.de>
 <20141025122921.0ad0652e@free-electrons.com>
 <56aabaa3604876fb38ac9833169f1b88@posteo.de>
Message-ID: <20141025184927.11fb4c7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 25 Oct 2014 15:41:02 +0200, J?rg Krause wrote:

> Many thanks for the thorough review! You even checked the license!
> 
> One question to the init script file: shairport-sync uses libdaemon for 
> creating the pidfile. Does this conflicts with the `-p` switch of 
> start-stop-daemon?

Well, in most cases, we use the daemonization feature of
start-stop-daemon rather than the built-in capability of the program to
daemonize itself. Which is why I've removed the -d option from
shairplay-sync.

Could you check if it continues to work properly for you? On my system,
I wasn't able to run shairplay-sync properly, because it seems to
require multicast support in the kernel, which wasn't enabled in my
case.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
