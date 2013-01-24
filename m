From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Jan 2013 07:39:04 +0100
Subject: [Buildroot] [PATCH] vsftpd: install sample config file to /etc
In-Reply-To: <50FD856D.3020002@relinux.de>
References: <1358328248-15016-1-git-send-email-sho@relinux.de>
 <50FA748B.903@mind.be> <50FD856D.3020002@relinux.de>
Message-ID: <5100D708.8010008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/21/13 19:14, Stephan Hoffmann wrote:
> Am 19.01.2013 11:25, schrieb Arnout Vandecappelle:
>> On 16/01/13 10:24, Stephan Hoffmann wrote:
>>> vsftpd comes with a sample config file that can serve as a starting
>>> point for customization and enables a basic functionality. Since
>>> this config refers to a directory "/usr/share/empty" this is also
>>> created.
>>
>>   I think the point of /usr/share/empty is that it's a directory that
>> doesn't exist, so vsftpd will not allow any up/download unless you
>> change the configuration file.
 >
> Arnout, Peter,
>
> I checked this. Obviously, vsftpd uses this directory to chroot there.
> If it isn't present it refuses to work:
>> 500 OOPS: vsftpd: not found: directory given in
>> 'secure_chroot_dir':/usr/share/empty
 >
> At least I admit that my commit message was misleading. So I'll send a
> patch to add this;-)
>
>>   I think it's a bad idea to default giving access to some random
>> location - even if it is read-only non-anonymous access to an empty
>> directory.
 >
> That is not the case. Default configuration allows anonymous login, but
> shows empty directory without write access.

  I still think it's better to make vsftpd fail to start than to give 
anonymous read-only access to some random empty directory. That way you 
at least notice that something is wrong.

  That said, it's no big deal. It's just a pity that if you provide a 
real vsftpd.conf in the post-build script, you'll still get this useless 
/usr/share/empty.

  Regards,
  Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
