From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 14 Apr 2016 16:39:24 +0100
Subject: [Buildroot] [PATCH] php: bump version to 7.0.5
In-Reply-To: <570FA554.1090503@zacarias.com.ar>
References: <1460629691-56260-1-git-send-email-Vincent.Riera@imgtec.com>
 <570FA554.1090503@zacarias.com.ar>
Message-ID: <570FB9AC.8050005@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

On 14/04/16 15:12, Gustavo Zacarias wrote:
> On 14/04/16 07:28, Vicente Olivert Riera wrote:
> 
>> - php-geoip: switched to HEAD of master on GitHub.
>>    - Bug: https://bugs.php.net/bug.php?id=71083
>>
>> - php-gnupg: switched to HEAD of master on GitHub.
>>    - Bug: https://bugs.php.net/bug.php?id=71138
>>
>> - php-imagick: bump version to 3.4.1.
>>    - Necessary to work with php-7.
>>
>> - php-memcached: switched to HEAD of master on GitHub.
>>    - Bug: https://bugs.php.net/bug.php?id=70751
>>
>> - php-ssh2: switched to HEAD of master on GitHub.
>>    - Bug: https://bugs.php.net/bug.php?id=71376
>>
>> - php-yaml: bump version to 2.0.0RC7.
>>    - Necessary to work with php-7.
>>
>> - php-zmq: bump version to 1.1.3.
>>    - Necessary to work with php-7.
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Hi Vicente.
> I believe splitting the pecl package bumps in a first batch of patches
> with the php bump at the end would be better suited, as long as those
> packages can built against the current php (normally they should).
> This would result in better bisectability, and no "all these bumps fix
> the build failures" scenario leading the php bump.

I know, but sadly some of those pecl packages do NOT build with php-5,
that's why I bumped everything together.

I could try to bump separately as much of them as possible, and then the
rest of them along with the php bump.

I'll come back with a v2 soon.

Thanks,

Vincent.

> Some people might argue about having both php versions side by side but
> i'm not one of them if we can avoid it.
> Regards.
