From: Stefan Froberg <stefan.froberg@petroprogram.com>
Date: Sun, 12 Aug 2012 22:16:59 +0300
Subject: [Buildroot] [PATCH] sqlite: Add new compile-time options
Message-ID: <1344799020-27916-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will add the following optional compile-time options to SQLite:

SQLITE_ENABLE_FTS3
SQLITE_ENABLE_UNLOCK_NOTIFY
SQLITE_SECURE_DELETE

To check what compile-time options currently are in your 
version of SQLite compile the following little test program with:

gcc -o sqlite_check sqlite_check.c -lsqlite3

#include <stdio.h>
#include <sqlite3.h>

int main(void)
{
	int n = 0;
	const char* s = NULL;
	
	printf("Your SQLite has the following compile-time options:\n");
	do {
		s = sqlite3_compileoption_get(n++);
		if(s != NULL)
			printf("%s\n",s);
	} while(s != NULL);

	return(0);
}
