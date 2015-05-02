From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat, 02 May 2015 13:30:13 +0200
Subject: [Buildroot] [PATCH v2 1/5] kconfig-package: add support for
 config fragments
In-Reply-To: <5544A8D0.5080009@mind.be>
References: <1430231675-8613-1-git-send-email-bos@je-eigen-domein.nl>
 <5544A8D0.5080009@mind.be>
Message-ID: <5544B545.6060809@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/2015 12:37 PM, Arnout Vandecappelle wrote:
> On 28/04/15 16:34, Floris Bos wrote:
>> Adds functionality to the kconfig infrastructure to merge additional
>> configuration fragment files to the main configuration file of
>> kconfig packages, using support/kconfig/merge_config.sh
>>
>> Typical use-case is when you want your configuration to be
>> kept in sync with an upstream (def)config file, but do require
>> some minor local modifications.
>>
>> Disables -update-config and -update-defconfig targets when
>> fragment files are set.
>>
>> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> [snip]
>
>> +* +FOO_KCONFIG_FRAGMENT_FILES+: a space-separated list of configuration
>> +  fragment files that are merged to the main configuration file.
>> +  Fragment files are typically used when there is a desire to stay in sync
>> +  with an upstream (def)config file, with some minor modifications.
>   I should have noticed this in the first iteration, but why do we need an
> additional config option for this? We could just rename _KCONFIG_FILE to
> _KCONFIG_FILES and update the help texts to explain that the files may consist
> of fragments.

Has been briefly discussed during the first iteration.
Main problem is _KCONFIG_FILE is not just a source file, but also a 
destination file for the update-config and update-defconfig targets.


-- 
Yours sincerely,

Floris Bos
