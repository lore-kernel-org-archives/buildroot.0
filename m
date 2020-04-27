From: Geoff Levand <geoff@infradead.org>
Date: Mon, 27 Apr 2020 09:23:59 -0700
Subject: [Buildroot] [PATCH 5/6] board/qemu/post-image.sh: start from a
 shell
In-Reply-To: <d499ec8a-9e8f-b900-04d2-654df9f8f9fb@gmail.com>
References: <20200426223325.1468127-1-romain.naour@gmail.com>
 <20200426223325.1468127-5-romain.naour@gmail.com>
 <d499ec8a-9e8f-b900-04d2-654df9f8f9fb@gmail.com>
Message-ID: <8d5c237d-4790-83c3-ccc6-d01184d93a3f@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4/27/20 9:09 AM, Romain Naour wrote:
>>  	export PATH="${HOST_DIR}/bin:\${PATH}"
>> -	exec ${QEMU_CMD_LINE} \${EXTRA_ARGS}
>> +	exec sh -c "${QEMU_CMD_LINE} \${EXTRA_ARGS}"
> 
> This patch is not ok as is since we need to escape double quotes from
> "${QEMU_CMD_LINE}
> 
> example:
> -append \"rootwait root=/dev/sda console=ttySC1,115200 noiotrap\"

Maybe use something like:

  CMD="${QEMU_CMD_LINE} ${EXTRA_ARGS}"
  eval exec ${CMD}

-Geoff
