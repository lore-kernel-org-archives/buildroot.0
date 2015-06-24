From: George Redivo <george.redivo@datacom.ind.br>
Date: Wed, 24 Jun 2015 15:51:54 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.1
In-Reply-To: <CANQCQpYy-kuZLfMjO0YrX8Kfa25eLUa09U-NUyOSQjxE0vq5WA@mail.gmail.com>
References: <1434995939-8236-1-git-send-email-george.redivo@datacom.ind.br>
 <CANQCQpYy-kuZLfMjO0YrX8Kfa25eLUa09U-NUyOSQjxE0vq5WA@mail.gmail.com>
Message-ID: <1313674444.2327407.1435171914537.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Peter. 

I looked to the ola's Config.in file and there is no powerpc dependency declared in there. 
So I'm not sure if it's valid to try to make a build to powerpc arch including this package. Is it? 

Anyway, I tried to reproduce the reported error by adding those flags in my .config file. 
In addition, I removed BR2_powerpc_8548=y, that was declared. 

I ran make olddefconfig and the .config changed. 
The BR2_PACKAGE_OLA flag simply dropped out from the .config file. 

May you send me your entire .config after running make olddefconfig please? 

Thanks for your attention. 

George Redivo 
DATACOM 
Ethernet Switches 
Rua Am?rica, 1000 - Eldorado do Sul, RS 
Ramal: 3444 
george.redivo at datacom.ind.br 
www.datacom.ind.br 



De: "Matthew Weber" <matthew.weber@rockwellcollins.com> 
Para: "DATACOM" <george.redivo@datacom.ind.br> 
Cc: "buildroot" <buildroot@buildroot.org> 
Enviadas: Segunda-feira, 22 de junho de 2015 18:21:13 
Assunto: Re: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.1 

George, 

On Mon, Jun 22, 2015 at 12:58 PM, George Redivo < george.redivo@datacom.ind.br > wrote: 


* Adds powerpc architecture support 



FYI, there is an old email thread related to a previous attempt at bumping where any compiler older then GCC4.7 has build issues with atomics. 
http://lists.busybox.net/pipermail/buildroot/2014-October/110418.html 

There was also some discussion at one of the previous Buildroot developer meetings about the direction suggested for handling this case. I was leaning towards just restricting based on toolchain version..... 

Thanks, 

-- 
Matthew L Weber / Pr Software Engineer 
Airborne Information Systems / Security Systems and Software / Secure Platforms 
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA 
www.rockwellcollins.com 

Note: Any Export License Required Information and License Restricted Third Party Intellectual Property (TPIP) content must be encrypted and sent to matthew.weber at corp.rockwellcollins.com . 


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150624/07b923c2/attachment.html>
