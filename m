From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Aug 2013 12:31:24 +0200
Subject: [Buildroot] [PATCH v2] pkg-download: take some more care of
 <PKG_>VERSION with git
In-Reply-To: <20130813121539.58b5e801@skate>
References: <1364931609-2459-1-git-send-email-Patrick.Boettcher@parrot.com>
 <20130813121539.58b5e801@skate>
Message-ID: <CAAXf6LXKe-tOam6+3SovzguJhNf=7p2sP2V_-_5A03dBn6NJ0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Aug 13, 2013 at 12:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue,  2 Apr 2013 21:40:08 +0200, Patrick Boettcher wrote:
>> This replaces the one-liner patch I made last week after a comment by
>> Thomas De Schampheleire. (it is now a 5-liner)
>>
>> I added comment to explain why using HEAD is better in the current
>> situation. I did not change the hg-part as it is different to git -
>> after a quick read it won't work at all when VERSION is not set in a
>> packge.
>>
>> Please apply if appropriate and helpful (it is for me).
>>
>> Patrick Boettcher (1):
>>   pkg-download: take some more care of <PKG_>VERSION when METHOD is git
>>
>>  package/pkg-download.mk |    6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> Thomas, Arnout, Gustavo, some thoughts about this patch?
>
> I'm not a big fan of the fact that <pkg>_VERSION would be optional for
> the git site method, but mandatory for the hg site method, but it's not
> really a strong opinion.

As I commented [1] on the original patch [2], I think git and
Mercurial should be treated equally where possible, so the patch as-is
is not yet ok.
Additionally, Arnout correctly noted in [3] that the patch is not
correct in all cases.

[1] http://lists.busybox.net/pipermail/buildroot/2013-March/070035.html
[2] http://lists.busybox.net/pipermail/buildroot/2013-March/070032.html
[3] http://lists.busybox.net/pipermail/buildroot/2013-April/070123.html

Best regards,
Thomas
