From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 May 2016 23:43:21 +0200
Subject: [Buildroot] [PATCH v1 1/4] libpjsip: add gnutls support and fix
 various things
In-Reply-To: <1719666448.88685.1462309711357.JavaMail.zimbra@savoirfairelinux.com>
References: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1461358628-9352-2-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <20160422232155.6ac9c7e2@free-electrons.com>
 <1719666448.88685.1462309711357.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <59f2bcec-6b91-7ddf-0a79-f5a85d6383fa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/16 23:08, Patrick Keroulas wrote:
> Hello Thomas,
>
> On Apr 22, 2016, at 5:21 PM, Thomas Petazzoni thomas.petazzoni at free-electrons.com wrote:
>> On Fri, 22 Apr 2016 16:57:05 -0400, Patrick Keroulas wrote:
[snip]
>>>  package/libpjsip/0003-Add-gnutls-support.patch     | 3373 ++++++++++++++++++++
>>
>> Please don't include the generated configure script changes. Just patch
>> configure.ac, and mark the package with <pkg>_AUTORECONF = YES.
>
> For some reason, configure.ac was replaced with aconfigure.ac and it seems that
> autoconf is excluded from the build process. Then, configure script actually points
> at pre-generated aconfigure.
>
> Q: Should I add a link to aconfigure.ac to avoid autoconf error?
> Or should I adjust <pkg>_AUTORECONF_(OPTS|ENV)

  I think the simplest approach is to symlink configure.ac -> aconfigure.ac in a 
post-patch hook. When autoconf is called, configure will be overwritten and 
aconfigure is not touched, but we don't call aconfigure directly anyway 
(configure is just calling aconfigure and nothing else).


>> However, Buildroot has the policy of not carrying feature patches,
>> which this one clearly is. Some please get this patch integrated
>> upstream first, and then we can benefit from this feature in Buildroot.
>>
>> Having large feature patches like this one in Buildroot would prevent
>> us from easily updating libpjsip in the future, which is not a
>> situation we like.
>
> We've been trying to push these patches up-stream for 2 years now, without response from pjproject.
> http://lists.pjsip.org/pipermail/pjsip_lists.pjsip.org/2014-May/017492.html
> http://lists.pjsip.org/pipermail/pjsip_lists.pjsip.org/2015-January/018072.html

  Well, in that case, we're even less motivated to carry these feature patches...

  But you can easily keep it in your own BR2_GLOBAL_PATCH_DIR.


  Regards,
  Arnout


>
> Thanks,
>
> Patrick
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
