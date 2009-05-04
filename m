From: Cyril HAENEL <chaenel@free.fr>
Date: Mon, 04 May 2009 14:02:36 +0200
Subject: [Buildroot] Problem with LZO package in ARM configuration,
 need help to solve the problem
In-Reply-To: <877i0x6r8l.fsf@macbook.be.48ers.dk>
References: <49FEC5F7.9070808@free.fr> <877i0x6r8l.fsf@macbook.be.48ers.dk>
Message-ID: <49FED95C.5040802@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Peter Korsgaard a ?crit :
>>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:
>>>>>>             
>
> Hi,
>
>  Cyril> Any idea from where the problem can come from ?
>
> Not right away...
>
>  Cyril> I maybe have an idea : why does the script use arm-linux-g++ compiler
>  Cyril> and not the complete path to the previously built arm compiler
>  Cyril> toolchain ?
>  Cyril> Because in fact it seems the configure script uses the arm-linux-g++
>  Cyril> compiler _installed_ _on_  _my_ _machine_ !! But this compiler is and
>  Cyril> old version (gcc3.4) and has nothing to do with buildroot normally
>  Cyril> !!??
>
> Ok, quick test - Rename the old compiler to arm-linux-g++-old and try
> again - Does it still hang?
>
>   
When I rename  arm-linux-g++ to  arm-linux-g++old, its blocks too but on 
arm-linux-c++...
Thus I renamed arm-linux-* and it works now, thank Peter !! The 
configure script do this :

checking for arm-linux-g++... no
checking for arm-linux-c++... no
checking for arm-linux-gpp... no
checking for arm-linux-aCC... no
checking for arm-linux-CC... no
checking for arm-linux-cxx... no
checking for arm-linux-cc++... no
checking for arm-linux-cl... no
checking for arm-linux-FCC... no
checking for arm-linux-KCC... no
checking for arm-linux-RCC... no
checking for arm-linux-xlC_r... no
checking for arm-linux-xlC... no
checking for g++... g++
checking whether we are using the GNU C++ compiler... no
checking whether g++ accepts -g... yes

In fact when we activate jffs2 filesystem output, lzo must be compiled 
for the host, thus why does it first try to use arm-linux-g++ !? It's 
why I am the only one to have this problem since some week, because I am 
the only one to have a arm toolchain installed on my computer !!

There is surely a bug to fix somewhere, but I don't know where !?

Cyril

-- 

Cyril Haenel
Registered Linux User #332632
