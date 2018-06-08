From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 8 Jun 2018 07:25:25 +0200
Subject: [Buildroot] scanpypi tool python error - local variable
 'download' referenced before assignment
In-Reply-To: <660c6058-1507-be7a-8cda-87fc741b8ed1@mind.be>
References: <55bf291b-22cf-b254-d04c-e7bf017f85be@jcz.nl>
 <660c6058-1507-be7a-8cda-87fc741b8ed1@mind.be>
Message-ID: <CAGm1_kuKXEY6CwKozVJxejXHp4AK6D55aRkNN53WrWBeuOYRwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Thu, Jun 7, 2018 at 11:16 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 06-06-18 17:29, Jaap Crezee wrote:
>> Hi all,
>>
>>
>> Is this a known issue?
>>
>> [jaap at jaap /data/work/htc/git/buildroot_development ]$ git log -1
>> commit f3d114a1effd8a6ef773bee14fe49ea6d8d7c350 (HEAD, tag: 2018.05)
>> Author: Peter Korsgaard <peter@korsgaard.com>
>> Date:   Fri Jun 1 22:22:57 2018 +0200
>>
>>     Update for 2018.05
>>
>>     Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> [jaap at jaap /data/work/htc/git/buildroot_development ]$ ./utils/scanpypi azure-iothub-device-client
>> buildroot package name for azure-iothub-device-client: python-azure-iothub-device-client
>> Package: python-azure-iothub-device-client
>> Fetching package azure-iothub-device-client
>> Traceback (most recent call last):
>>   File "./utils/scanpypi", line 716, in <module>
>>     main()
>>   File "./utils/scanpypi", line 648, in main
>>     package.download_package()
>>   File "./utils/scanpypi", line 217, in download_package
>>     if download.__class__ == six.moves.urllib.error.HTTPError:
>> UnboundLocalError: local variable 'download' referenced before assignment
>> [jaap at jaap /data/work/htc/git/buildroot_development ]$
>
>  This happens because the metadata doesn't contain urls.
>
>  scanpypi is not at all robust against unexpected metadata contents. I think we
> should add some exception handling there that just prints the metadata (or the
> relevant parts of it), and continues with other packages (in case it's a
> dependency of the package that was requested).
>
>  Yegor?

I'll take care about this.

Yegor
