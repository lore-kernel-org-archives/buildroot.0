From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Mar 2016 22:21:49 +0100
Subject: [Buildroot] [PATCH 1/2] help: add a way to document targets
 declared in local.mk/external.mk
In-Reply-To: <20160308220221.0a5088d0@free-electrons.com>
References: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
 <56DF3C1F.30205@mind.be> <20160308220221.0a5088d0@free-electrons.com>
Message-ID: <56DF426D.2000800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/08/16 22:02, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 8 Mar 2016 21:54:55 +0100, Arnout Vandecappelle wrote:
>> On 11/18/15 15:37, J?r?me Pouiller wrote:
>>> It is handy to use local.mk or external.mk to add specific targets
>>> for current project. However, until now, it not possible to add help
>>> message these targets.
>>> This patch add LOCAL_HELP variable. This variable is aimed to be assigned
>>> from any .mk files. Its content is displayed with 'make help'.
>>>
>>> For exemple:
>>>     LOCAL_HELP += "flash                  - Flash target"
>>>     LOCAL_HELP += "chroot                 - Chroot into target/"
>>>     LOCAL_HELP += "qemu                   - Run image with qemu"
>>>     LOCAL_HELP += "install-nfs            - Extract rootfs in \$$NFSROOT (=$(NFSROOT))"
>>>     LOCAL_HELP += "`printf '%-22s%s' '$(var)-feature' ' - Call $(var) feature'`"
>>>     LOCAL_HELP += "Please contact support at company.com in case of problem."
>>>
>>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
>>
>>    Looks good to me, except that I don't like the name 'LOCAL'. I'd prefer e.g.
>> ADDITIONAL.
>
> Wouldn't EXTERNAL_HELP be even better, suggesting that its main
> use-case is for BR2_EXTERNAL ?

  Works for me as well. Additional is a word we're currently not using at all, 
so perhaps reusing external is better.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
