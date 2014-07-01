From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 Jul 2014 20:11:45 +0200
Subject: [Buildroot] Glibc LD_LIBRARAY_PATH error
In-Reply-To: <20140628174420.2fd3ed86@free-electrons.com>
References: <CAMhj5sakLa9ROf4RVO2N1rhRx+4du=j3X8OL5rLVRAUQRnFS+Q@mail.gmail.com>
 <20140628000126.4bfd6329@free-electrons.com>
 <CAMhj5sZkdpe+mrTzvxqrwK=-tOoyG4nvobM48PJJpw3oFcb5CA@mail.gmail.com>
 <20140628083612.167f7b88@free-electrons.com>
 <CAMhj5sbiKrQ7PkbrxXr=CK34x2LA2bFu95asfCv8iKS5UtEMiQ@mail.gmail.com>
 <20140628162843.41a203d7@free-electrons.com>
 <CAMhj5saaeT9uoHNk2CZLf8da=ds8Zr0r2va15GFdZwrqxe0ENA@mail.gmail.com>
 <CAMhj5sYLbx5_4-qQhtpsYO6+fewS+tU1sDSDB9qn1CqJ-QoyiQ@mail.gmail.com>
 <20140628174420.2fd3ed86@free-electrons.com>
Message-ID: <53B2F9E1.7080609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/06/14 17:44, Thomas Petazzoni wrote:
> On Sat, 28 Jun 2014 20:06:30 +0430, Panahi Parsa wrote:
> 
>> > my problem was solved by your solution I mean using "unset LD_LIBRARY_PATH"
> Ok. I'm not sure why we don't simply unset the LD_LIBRARY_PATH from our
> main Makefile. Probably we should just do it.

 I could imagine an ancient build host where the developer has to build his own
python2.7 or other buildroot-dependencies. Not really realistic, though, because
then the executable should just set its DT_RPATH/DT_RUNPATH.

 Also, we already have a check for LD_LIBRARY_PATH in dependencies.sh. It just
doesn't check for empty path elements, only for . path elements.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
