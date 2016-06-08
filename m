From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 8 Jun 2016 22:35:02 +0200
Subject: [Buildroot] [PATCH] package/fetchmail: fix *.pyc compilation
In-Reply-To: <20160608222517.2e1a61ea@free-electrons.com>
References: <20160608200851.7108-1-s.martin49@gmail.com>
 <20160608222517.2e1a61ea@free-electrons.com>
Message-ID: <CAHXCMMLRjRmNFEp_a-BU+xRgK22Qh14ty3XKNzNXpspd80w-+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 8, 2016 at 10:25 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed,  8 Jun 2016 22:08:51 +0200, Samuel Martin wrote:
>> This change fixes the fetchmailconf.py compilation by adding a couple of
>> patches making this script compatible with both python-2 and python-3:
>> - tabs/spaces indentation fixes;
>> - 2to3 fixes.
>>
>> Fixes:
>>   http://autobuild.buildroot.org/results/700/7009445dd116a1c02db82a351d38db44db8dad16/build-end.log
>>   ...
>>
>> These fetchmail patches have been sent upstream [1].
>>
>> [1] https://sourceforge.net/p/fetchmail/mailman/message/35146111/
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> What is this fetchmailconf.py thing? I don't think we care enough about
> it (it's not central to fetchmail functionality), so instead of
> carrying a 3000+ lines patches, I would suggest to simply remove this
> script in a post-install target hook.
I hesitated to do so, but since I did the fix, I posted it...
I'll do the hook.

Regards,

-- 
Samuel
