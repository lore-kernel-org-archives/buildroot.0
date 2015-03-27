From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Mar 2015 22:31:02 +0100
Subject: [Buildroot] [PATCH 1/7 v3] support/download: make hash file
 optional
In-Reply-To: <CAMQcK5JmZ=r6U7eV4pR_GYa3-eP_VhXu-QBRf-WtvGdcUZTFDw@mail.gmail.com>
References: <cover.1427037564.git.yann.morin.1998@free.fr>
 <5f50190fe62d33438bfe4c68ab566698c63d5102.1427037564.git.yann.morin.1998@free.fr>
 <CAMQcK5JmZ=r6U7eV4pR_GYa3-eP_VhXu-QBRf-WtvGdcUZTFDw@mail.gmail.com>
Message-ID: <5515CC16.9030506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/03/15 20:03, Ryan Barnett wrote:
> Yann,
> 
> On Sun, Mar 22, 2015 at 10:21 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Currently, specifying a hash file for our download wrapper is mandatory.
>>
>> However, when we download a git, svn, bzr, hg or cvs tree, there's by
>> design no hash to check the download against.
> 
> I was thinking about hashes for the git/svn/(other VCS) and how these
> sources could be provided by the buildroot sources mirror -
> http://sources.buildroot.org/ or a primary download site. Do you have
> an idea of how we could utilize hash checking if buildroot were to
> pull the sources from one of these methods? There could be a "man in
> the middle" attack since the sources mirror or the primary site just
> provides a tar of these VCS repositories
> 
> This could be especially useful for when the BR2_PRIMARY_SITE_ONLY is
> used. This wouldn't necessarily for "man in the middle" attacks but
> for ensure that your downloads don't get corrupt.

 Yes, I had exactly the same concept in mind. The Debian Reproducible Builds
Wiki [1] has some interesting leads. It basically boils down to adding --owner,
--group and --mtime options to tar, and making sure that the list of files is
passed explicitly instead of relying on directory order.

 One difficulty is git archive, because AFAIK it doesn't support passing extra
arguments to tar or choosing the ordering of the files.


 Regards,
 Arnout


[1] https://wiki.debian.org/ReproducibleBuilds/Howto

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
