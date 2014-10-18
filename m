From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 13:02:58 +0200
Subject: [Buildroot] [PATCH buildroot-test 6/8] autobuild-run: create
 main method to locally-scope all variables
In-Reply-To: <20141017222448.GR3971@free.fr>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
 <1413486964-5183-6-git-send-email-patrickdepinguin@gmail.com>
 <20141017222448.GR3971@free.fr>
Message-ID: <CAGduivw+x0JCf_MxHFCt1+RbAg3wQbtsLm-bpD8OT1x_n1p5aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, all

Acked-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>

On Sat, Oct 18, 2014 at 12:24 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-10-16 21:16 +0200, Thomas De Schampheleire spake thusly:
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> In the current autobuild-run script, all variables created in the 'main'
>> part are in fact global, even though the script does not intend them to
>> be. For example, sysinfo is global, even though it is passed as function
>> argument to run_instance.
>>
>> To avoid this accidental globalization, create a main method instead.
>> All variables created therein are now local to that method.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> For what it's worth:
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> ;-)
>
> Regards,
> Yann E. MORIN.
>
>> ---
>>  scripts/autobuild-run | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
>> index 57654de..95f2390 100755
>> --- a/scripts/autobuild-run
>> +++ b/scripts/autobuild-run
>> @@ -575,7 +575,7 @@ def merge(dict_1, dict_2):
>>      return dict((str(key), dict_1.get(key) or dict_2.get(key))
>>                  for key in set(dict_2) | set(dict_1))
>>
>> -if __name__ == '__main__':
>> +def main():
>>      check_version()
>>      sysinfo = SystemInfo()
>>
>> @@ -604,3 +604,6 @@ if __name__ == '__main__':
>>      signal.signal(signal.SIGTERM, sigterm_handler)
>>      for p in processes:
>>          p.join()
>> +
>> +if __name__ == '__main__':
>> +    main()
>> --
>> 1.8.5.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
