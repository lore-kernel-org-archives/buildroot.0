From: Michael Baudino <michael@baudi.no>
Date: Sat, 19 Dec 2020 11:38:10 +0000
Subject: [Buildroot] [PATCH] package/go: fix a typo in CC and CXX env
 values
In-Reply-To: <20201219111146.GG3188@scaer>
References: <8selkOZpKE5CREY0ZZ4DfQgdVGdikFT69Rfm3Jo05uQO5vUDo-KlPp3AZiao5Qiwu03f-XUFHGg6uuYrhxGJYLk_9KqwZcQbj2O2ue5jaAc=@baudi.no>
 <20201219111146.GG3188@scaer>
Message-ID: <rDBFX1ZQA2ztWDQmG-IWNS2l7QI0Ksz7Y7qnGby2x-o924jqY1N-YbUX9R627F0zhCvEJaLh0099jec9EuuS4UGnINUC5EYY2mrt4fsjJ1Y=@baudi.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Thanks for taking the manual extra steps ? (on both patches!)

I created the patch with `git format-patch` but I have `diff.noprefix` in my global git config, may this have caused the depth issue?

Anyway, thanks for accepting the patch and for all the work done on Buildroot ??

-------- Original Message --------
On Dec 19, 2020, 12:11, Yann E. MORIN wrote:

> Michael, All,
>
> On 2020-12-18 09:57 +0000, Michael Baudino spake thusly:
>> This commit fixes a typo in variable names that caused CC and CXX
>> environment variables to be empty.
>>
>> Signed-off-by: Michael Baudino <michael@baudi.no>
>
> Applied to master, thanks.
>
> However, see a little comment, below...
>
>> ---
>> package/go/go.mk | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git package/go/go.mk package/go/go.mk
>> index d9f4905..cabbdc8 100644
>> --- package/go/go.mk
>> +++ package/go/go.mk
>
> I'm not sure how you generated your patch, but this does not apply as-is
> because it is not the expected depth, so git-am chokes on it.
>
> Next time, please use 'git send-email' to send your patches, as it
> ensures that patches are properly formatted.
>
> I fixed it locally (and will do so on your next patch too), so no need
> to resend those two.
>
> Regards,
> Yann E. MORIN.
>
>> @@ -99,8 +99,8 @@ HOST_GO_HOST_ENV = \
>> $(HOST_GO_COMMON_ENV) \
>> GOARCH="" \
>> GOCACHE="$(HOST_GO_HOST_CACHE)" \
>> - CC="$(HOST_CCNOCCACHE)" \
>> - CXX="$(HOST_CXXNOCCACHE)" \
>> + CC="$(HOSTCC_NOCCACHE)" \
>> + CXX="$(HOSTCXX_NOCCACHE)" \
>> CGO_CFLAGS="$(HOST_CFLAGS)" \
>> CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
>> CGO_LDFLAGS="$(HOST_LDFLAGS)"
>> --
>> 2.7.4
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> | Yann E. MORIN | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software Designer | \ / CAMPAIGN | ___ |
> | +33 561 099 427 `------------.-------: X AGAINST | \e/ There is no |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL | v conspiracy. |
> '------------------------------^-------^------------------^--------------------'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201219/a3297b6e/attachment.html>
