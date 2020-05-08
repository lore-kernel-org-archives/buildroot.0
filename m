From: DATACOM - Joao <joao@datacom.com.br>
Date: Fri, 8 May 2020 16:57:16 -0300
Subject: [Buildroot] Help: build-root compile and debug
In-Reply-To: <CACEFAc0VbotiJs4W0JeZXJK5JsUPBFHYbSjDdjFfgezs1xfHhQ@mail.gmail.com>
References: <CACEFAc0u58WHf7=ke1iAKP1+ftvr52yEnq8DHiufdJy4rNKKwQ@mail.gmail.com>
 <CACEFAc1TJwomj5_GN+rmxDZ5VKHoTkAF19r4tJJTQQ_VeeHMaw@mail.gmail.com>
 <CACEFAc0BAoQM_zPxCU17GQzca23fV8QtKe8yFryHWj1K1xYu9Q@mail.gmail.com>
 <CACEFAc0v5298rW08semTtB82ozxyv-gq9dmCOUeD8uU53m6ang@mail.gmail.com>
 <CACEFAc2_WcHo-VKKf-Z4fx=VyKzMCC+XSNZ=zApimtjFGxMtrQ@mail.gmail.com>
 <CACEFAc2YQvotkjCmRZJHaETQoEK7OYW4oqqq_mpM_6YEJzZFgQ@mail.gmail.com>
 <CACEFAc3xWYYLMmxcJYfSqwHmpWwf4hKSPOG5UGgwr9OHmtgY6g@mail.gmail.com>
 <CACEFAc1m9d5+d3DrmOQLFPmQZ_4btapSU05vaAOSLTbM6HVrRQ@mail.gmail.com>
 <CACEFAc21hKusY2LPZojBJe+HBYws5EKy=_ar4Lm7k-b7W1vRxg@mail.gmail.com>
 <0105e61a-28bf-9d72-ecd3-f285102fcbfa@datacom.com.br>
 <CACEFAc0VbotiJs4W0JeZXJK5JsUPBFHYbSjDdjFfgezs1xfHhQ@mail.gmail.com>
Message-ID: <4d077e3c-eb31-bfe0-b6b4-7396df019355@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kunal.

Em 08/05/2020 14:17, Kunal Chauhan escreveu:
> 1.Busy box is one of the package this line is not clear to me.
 From buildroot tree there is a directory called package/busybox which 
defines recipe and how busybox shall be installed. Try to build some 
existing defconfig that contains busybox 
(qemu_arm_versatile_nommu_defconfig maybe) and keep an eye on output so 
you will see how it goes.
>
> 2. I consider a scenerio please guide on same as below
> Like I have some code repo and a build.sh script , this script creates 
> some build_root folder under which some folder is like, LINUX , 
> package etc.
> I am not understood exactly the usage ?

I suggest you to take a look on package directory and its various 
packages. Refer to 
https://buildroot.org/downloads/manual/manual.html#adding-packages , it 
is simpler than it looks on first glance. :)

Trying to explain a little more is just a question of defining build 
commands (to call build.sh somehow) and install commands so buildroot 
can copy binaries that really matters from your build tree into target 
filesystem.

Again, using an existing defconfig is the best primer you can get to see 
all the concepts applied.

>
>
> On 8 May 2020 10:11 p.m., "DATACOM - Joao" <joao@datacom.com.br 
> <mailto:joao@datacom.com.br>> wrote:
>
>     Hello Kunal.
>
>     I will try to help you out.
>
>     Em 08/05/2020 13:19, Kunal Chauhan escreveu:
>>     Hi Team,,
>>
>>     1. What is the realtion between build root and busy box. ? Not
>>     clear to me
>
>     Buildroot is a buildsystem. Its output comprises a Linux kernel
>     and a collection of packages which are instructions on how to
>     build different binaries to archieve a coherent Linux system.
>
>     Busybox happens to be one of these packages.
>
>>     2.As we compile whole linux some build output comes in case of
>>     busy box also if am not wrong.
>
>     I would say firmware image as you stated below instead of Linux
>     but you got the point here.
>
>>     So will it be ?a firmware image , if yes then ?will it can
>>     ?contain multiple ?binaries.
>     Yes!
>>
>>     3. If point 2 is yes , if one of user binary crash what will be
>>     the way to find crash point in that binaries.
>     You shall use the same strategies on debugging userspace binaries
>     on a PC (e.g. gdb, printf, log files and so). Buildroot is
>     responsible to help you out defining buildtime dependencies - it
>     is up to the user make it work. :)
>>
>>
>>
>>
>>     Thanks
>>     Kunal
>>
(...)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200508/673fd077/attachment.html>
