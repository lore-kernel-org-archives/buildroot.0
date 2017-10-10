From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Oct 2017 23:25:03 +0200
Subject: [Buildroot] [PATCH] utils/genrandconfig: use
 --no-check-certificate in wget by default
In-Reply-To: <20171010222543.0beed48d@windsurf.lan>
References: <20170902212938.23712-1-thomas.petazzoni@free-electrons.com>
 <20171010222543.0beed48d@windsurf.lan>
Message-ID: <f8f82c6a-f51a-8fe6-dc3a-dfc061dd7955@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-10-17 22:25, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat,  2 Sep 2017 23:29:38 +0200, Thomas Petazzoni wrote:
>> A number of autobuilder failures are due to the fact that autobuilder
>> instances use old distributions, with old SSL certificates, and
>> therefore wget aborts with an error "The certificate of `xyz.org' is
>> not trusted.".

 I don't understand how this can happen. The autobuilders should all be running
supported (not EOL) distros, right? And in a supported distro, I'd expect
ca-certificates get updated. Otherwise the distro becomes next to useless.

 But I seem to remember that you have a CentOS 5 autobuilder running, and CentOS
5 went EOL on March 31, 2017. So perhaps it's time to switch to CentOS 6?


>> In order to avoid such failures that are not very interesting in the
>> context of the autobuilders

 I think they *are* interesting (not very, but still interesting), because
actual users *will* hit these problems.

>> , we pass --no-check-certificate to
>> wget. The integrity of the downloaded files is anyway verified by the
>> hashes, and this is only meant to be used in the context of
>> testing/CI, not in production.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Would it be possible to get some feedback on this patch?
> 
> We recently bump dbus to 1.10.24, and look how the autobuilders are
> "polluted" by this certificate issue:
> http://autobuild.buildroot.net/?reason=dbus-1.10.24.

 But once Peter updates sources.buildroot.org that should be OK again, no?

 Regards,
 Arnout

> 
> We've got two options: either we do it in utils/genrandconfig as
> proposed, or we do it in the autobuild-run script that runs on the
> autobuilder slaves.
> 
> Comments ?
> 
> Thanks,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
