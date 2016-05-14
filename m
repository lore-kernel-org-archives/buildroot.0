From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 14 May 2016 10:32:25 -0300
Subject: [Buildroot] [PATCH 1/2] openvpn: remove polarssl crypto backend
 options
In-Reply-To: <4261166d-7b9f-00b1-1c9d-884d286ffd69@mind.be>
References: <1462893074-29188-1-git-send-email-gustavo@zacarias.com.ar>
 <4261166d-7b9f-00b1-1c9d-884d286ffd69@mind.be>
Message-ID: <573728E9.90200@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/05/16 16:38, Arnout Vandecappelle wrote:


>> +config BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL
>> +    bool "openvpn openssl crypto backend option removed"
>> +    select BR2_LEGACY
>> +    help
>> +      The OpenVPN openssl crypto backend options has been removed.
>> +      It's now the only possible option.
>
>   I think we don't need to add this to the legacy handling.
>
>   The purpose of legacy handling is to warn users that their
> configuration does not work anymore like it did before. In case an
> option has been renamed, we make sure that the new name is selected, but
> we still select BR2_LEGACY because at some point the legacy handling for
> that option will be removed as well.
>
>   In this case, however, it doesn't help at all that the user is warned:
> his openvpn will work exactly the same as it did before, but he has to
> go and disable this option anyway.
>
>   So I'd say remove this option from Config.in.legacy...

Hi.
Yes, i had doubts about it so off it goes, just to warn this was no 
longer an option.
Regards.
